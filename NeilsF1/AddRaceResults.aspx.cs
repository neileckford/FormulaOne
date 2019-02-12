using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NeilsF1
{
    public partial class AddRaceResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int raceID = Int32.Parse(SqlDataSource1.SelectParameters["param1"].DefaultValue);

            using (FormulaOneDataContext Data = new FormulaOneDataContext())
            {
                if (!IsPostBack)
                {
                    var race = Data.Races.Single(Race => Race.RaceID == raceID);

                    RaceTitleLbl.Text = race.RaceName;
                    RaceTitleDpd.SelectedValue = String.Format("{0}", raceID);
                    PositionTxt.Text = SetPosition(raceID);
                }
            }
        }

        protected void RaceTitleDpd_SelectedIndexChanged(object sender, EventArgs e)
        {
            int raceID = Int32.Parse(RaceTitleDpd.SelectedValue);

            SqlDataSource1.SelectParameters["param1"].DefaultValue = raceID.ToString();
            SqlDataSource1.DataBind();

            getRaceResults(raceID);
        }

        private void getRaceResults(int raceID)
        {
            using (FormulaOneDataContext Data = new FormulaOneDataContext())
            {
                var race = Data.Races.Single(Race => Race.RaceID == raceID);

                RaceTitleDpd.SelectedValue = string.Format("{0}", race.RaceID);

                RaceTitleLbl.Text = race.RaceName;

                GridViewRaceResult.DataBind();

                PositionTxt.Text = SetPosition(race.RaceID);
            }
        }

        protected void AddResultBtn_Click(object sender, EventArgs e)
        {
            addResult();
        }

        private void addResult()
        {
            using (FormulaOneDataContext Data = new FormulaOneDataContext())
            {
                var allResults = Data.RaceResults.Where(RaceResult => RaceResult.RaceID == Int32.Parse(RaceTitleDpd.SelectedValue));

                foreach (RaceResult result in allResults)
                {
                    if (result.FinalPosition.Trim() == PositionTxt.Text || result.DriverID == Int32.Parse(DriverCbx.SelectedValue))
                    {
                        return;
                    }
                }

                RaceResult raceResult = new RaceResult();

                raceResult.RaceID = Int32.Parse(RaceTitleDpd.SelectedValue);
                raceResult.DriverID = Int32.Parse(DriverCbx.SelectedValue);
                raceResult.TeamID = Int32.Parse(TeamCbx.SelectedValue);
                raceResult.FinalPosition = PositionTxt.Text;
                raceResult.RaceTime = TimeSpan.FromHours(Int32.Parse(HourTxt.Text))
                    + TimeSpan.FromMinutes(Int32.Parse(MinuteTxt.Text))
                    + TimeSpan.FromSeconds(Int32.Parse(SecondTxt.Text));

                Data.RaceResults.InsertOnSubmit(raceResult);
                Data.SubmitChanges();
                GridViewRaceResult.DataBind();
            }

            getRaceResults(Int32.Parse(RaceTitleDpd.SelectedValue));
        }

        private string SetPosition(int raceID)
        {
            using (FormulaOneDataContext Data = new FormulaOneDataContext())
            {
                var RaceResults = Data.RaceResults.Where(Results => Results.RaceID == raceID);
                Boolean match = true;

                for (int i = 1; i <= 22; i++)
                {
                    match = false;

                    foreach (RaceResult result in RaceResults)
                    {
                        if (result.FinalPosition.Trim() == string.Format("{0}", i))
                        {
                            match = true;
                            break;
                        }
                    }

                    if (!match)
                    {
                        return string.Format("{0}", i);
                    }
                }
            }

            return null;
        }

        protected void GridViewRaceResult_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            PositionTxt.Text = SetPosition(Int32.Parse(RaceTitleDpd.SelectedValue));
        }

        protected void GridViewRaceResult_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            PositionTxt.Text = SetPosition(Int32.Parse(RaceTitleDpd.SelectedValue));
        }
    }
}
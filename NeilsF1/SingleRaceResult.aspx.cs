using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NeilsF1
{
    public partial class SingleRaceResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RaceTitleDpd_SelectedIndexChanged(object sender, EventArgs e)
        {
            //getRaceResults(Int32.Parse(RaceTitleDpd.SelectedValue));
        }

        private void getRaceResults(int raceID)
        {
            using (FormulaOneDataContext Data = new FormulaOneDataContext())
            {
                var race = Data.Races.Single(Race => Race.RaceID == raceID);

                RaceTitleLbl.Text = race.RaceName;
                SqlDataSource1.SelectCommand += " WHERE RaceResult.RaceID = " + raceID;
                SqlDataSource1.DataBind();
            }
        }
    }
}
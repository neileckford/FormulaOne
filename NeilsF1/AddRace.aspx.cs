using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.IO;
using System.Data;

namespace NeilsF1
{
    public partial class AddRace : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddRaceBtn_Click(object sender, EventArgs e)
        {
            addNewRace();
        }

        private void addNewRace()
        {
            using (FormulaOneDataContext Data = new FormulaOneDataContext())
            {
                Race race = new Race();

                race.RaceName = RaceNameTxt.Text;
                race.CircuitID = Int32.Parse(CircuitDpd.SelectedValue);

                Data.Races.InsertOnSubmit(race);
                Data.SubmitChanges();

                Response.Redirect("~/AddRace");
            }
        }

        protected void GridView1_RowDataBound(object sender,
                         GridViewRowEventArgs e)
        {

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NeilsF1
{
    public partial class ShowTeams : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getTeamDetails();
        }

        private void getTeamDetails()
        {
            using (FormulaOneDataContext Data = new FormulaOneDataContext())
            {
                Team team = Data.Teams.Single(Team => Team.TeamID == 3);

                teamNameLbl.Text = team.TeamName;

                // select the 2 drivers of that team
                var Drivers = Data.Drivers.Where(Driver => Driver.TeamID == team.TeamID);

                List<string> teamMembers = new List<string>();

                foreach (Driver driver in Drivers)
                {
                    teamMembers.Add(driver.FirstName + " " + driver.SecondName);
                }

                driver1Lbl.Text = teamMembers[0];
                driver2Lbl.Text = teamMembers[1];
            }
        }
    }
}
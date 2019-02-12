using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NeilsF1
{
    public partial class AddTeam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addTeamBtn_Click(object sender, EventArgs e)
        {
            using (FormulaOneDataContext Data = new FormulaOneDataContext())
            {
                Team team = new Team();

                team.TeamName = TeamNameTxt.Text;
                team.Constructor = ConstructorTxt.Text;
                team.Chassis = ChassisTxt.Text;
                team.Engine = EngineTxt.Text;

                Data.Teams.InsertOnSubmit(team);
                Data.SubmitChanges();

                Response.Redirect("~/AddTeam");
            }
        }
    }
}
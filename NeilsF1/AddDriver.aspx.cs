using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NeilsF1
{
    public partial class AddDriver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitDriver_Click(object sender, EventArgs e)
        {
            addNewDriver();
        }

        private void addNewDriver()
        {
            using (FormulaOneDataContext Data = new FormulaOneDataContext())
            {
                Driver driver = new Driver();

                driver.FirstName = FirstNameTxt.Text;
                driver.SecondName = SecondNameTxt.Text;
                driver.TeamID = Int32.Parse(DropDownTeams.SelectedValue);

                Data.Drivers.InsertOnSubmit(driver);
                Data.SubmitChanges();

                Response.Redirect("~/AddDriver");
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NeilsF1
{
    public partial class AddCircuit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            addNewCircuit();
        }

        private void addNewCircuit()
        {
            using (FormulaOneDataContext Data = new FormulaOneDataContext())
            {
                Circuit circuit = new Circuit();

                circuit.CircuitName = TextBox1.Text;

                Data.Circuits.InsertOnSubmit(circuit);
                Data.SubmitChanges();

                Response.Redirect("~/AddCircuit");
            }
        }
    }
}
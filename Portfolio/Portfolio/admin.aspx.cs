using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Portfolio
{
    public partial class admin : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProjects();
                LoadServices();
                LoadAbout();
                LoadContact();
            }
        }

        // ================= PORTFOLIO =================
        private void LoadProjects()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM latest_p", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvProjects.DataSource = dt;
                gvProjects.DataBind();
            }
        }

        // ✅ Insert New Project
        protected void btnAddProject_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "INSERT INTO latest_p (ProjectName, Description, ImageUrl, ProjectLink) VALUES (@ProjectName, @Description, @ImageUrl, @ProjectLink)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ProjectName", txtProjectName.Text.Trim());
                cmd.Parameters.AddWithValue("@Description", txtProjectDesc.Text.Trim());
                cmd.Parameters.AddWithValue("@ImageUrl", txtProjectImage.Text.Trim());
                cmd.Parameters.AddWithValue("@ProjectLink", txtProjectLink.Text.Trim());

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            txtProjectName.Text = "";
            txtProjectDesc.Text = "";
            txtProjectImage.Text = "";
            txtProjectLink.Text = "";
            LoadProjects();

        }

        // ✅ Update Project
        protected void gvProjects_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int projectId = Convert.ToInt32(gvProjects.DataKeys[e.RowIndex].Value);

            string projectName = (gvProjects.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
            string description = (gvProjects.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text;
            string imageUrl = (gvProjects.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text;
            string projectLink = (gvProjects.Rows[e.RowIndex].Cells[4].Controls[0] as TextBox).Text;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE latest_p SET ProjectName=@ProjectName, Description=@Description, ImageUrl=@ImageUrl, ProjectLink=@ProjectLink WHERE ProjectID=@ProjectID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ProjectName", projectName);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@ImageUrl", imageUrl);
                cmd.Parameters.AddWithValue("@ProjectLink", projectLink);
                cmd.Parameters.AddWithValue("@ProjectID", projectId);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            gvProjects.EditIndex = -1;
            LoadProjects();


        }


        protected void gvProjects_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e) { gvProjects.EditIndex = e.NewEditIndex; LoadProjects(); }
        protected void gvProjects_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e) { gvProjects.EditIndex = -1; LoadProjects(); }
      
        protected void gvProjects_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvProjects.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM latest_p WHERE ProjectID=@id", con);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open(); cmd.ExecuteNonQuery(); con.Close();
            }
            LoadProjects();
        }

        // ================= SERVICES =================
        private void LoadServices()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Services", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvServices.DataSource = dt;
                gvServices.DataBind();
            }
        }

        protected void btnAddService_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string q = "INSERT INTO Services(ServiceName, Description) VALUES(@n,@d)";
                SqlCommand cmd = new SqlCommand(q, con);
                cmd.Parameters.AddWithValue("@n", txtServiceName.Text);
                cmd.Parameters.AddWithValue("@d", txtServiceDesc.Text);
                con.Open(); cmd.ExecuteNonQuery(); con.Close();
            }
            txtServiceName.Text = ""; txtServiceDesc.Text = "";
            LoadServices();
        }

        protected void gvServices_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e) { gvServices.EditIndex = e.NewEditIndex; LoadServices(); }
        protected void gvServices_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e) { gvServices.EditIndex = -1; LoadServices(); }
        protected void gvServices_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvServices.DataKeys[e.RowIndex].Value);
            string name = ((System.Web.UI.WebControls.TextBox)gvServices.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string desc = ((System.Web.UI.WebControls.TextBox)gvServices.Rows[e.RowIndex].Cells[2].Controls[0]).Text;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string q = "UPDATE Services SET ServiceName=@n, Description=@d WHERE ServiceID=@id";
                SqlCommand cmd = new SqlCommand(q, con);
                cmd.Parameters.AddWithValue("@n", name);
                cmd.Parameters.AddWithValue("@d", desc);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open(); cmd.ExecuteNonQuery(); con.Close();
            }
            gvServices.EditIndex = -1; LoadServices();
        }
        protected void gvServices_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvServices.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Services WHERE ServiceID=@id", con);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open(); cmd.ExecuteNonQuery(); con.Close();
            }
            LoadServices();
        }

        // ================= ABOUT =================
        private void LoadAbout()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM About", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvAbout.DataSource = dt;
                gvAbout.DataBind();
            }
        }

        protected void btnAddAbout_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string q = "INSERT INTO About(Title, Content) VALUES(@t,@c)";
                SqlCommand cmd = new SqlCommand(q, con);
                cmd.Parameters.AddWithValue("@t", txtAboutTitle.Text);
                cmd.Parameters.AddWithValue("@c", txtAboutContent.Text);
                con.Open(); cmd.ExecuteNonQuery(); con.Close();
            }
            txtAboutTitle.Text = ""; txtAboutContent.Text = "";
            LoadAbout();
        }

        protected void gvAbout_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e) { gvAbout.EditIndex = e.NewEditIndex; LoadAbout(); }
        protected void gvAbout_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e) { gvAbout.EditIndex = -1; LoadAbout(); }
        protected void gvAbout_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvAbout.DataKeys[e.RowIndex].Value);
            string title = ((System.Web.UI.WebControls.TextBox)gvAbout.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string content = ((System.Web.UI.WebControls.TextBox)gvAbout.Rows[e.RowIndex].Cells[2].Controls[0]).Text;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string q = "UPDATE About SET Title=@t, Content=@c WHERE AboutID=@id";
                SqlCommand cmd = new SqlCommand(q, con);
                cmd.Parameters.AddWithValue("@t", title);
                cmd.Parameters.AddWithValue("@c", content);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open(); cmd.ExecuteNonQuery(); con.Close();
            }
            gvAbout.EditIndex = -1; LoadAbout();
        }
        protected void gvAbout_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvAbout.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM About WHERE AboutID=@id", con);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open(); cmd.ExecuteNonQuery(); con.Close();
            }
            LoadAbout();
        }

        // ================= CONTACT =================
        private void LoadContact()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Contact", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvContact.DataSource = dt;
                gvContact.DataBind();
            }
        }

        protected void gvContact_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvContact.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Contact WHERE ContactID=@id", con);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open(); cmd.ExecuteNonQuery(); con.Close();
            }
            LoadContact();
        }
    }
}


using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Portfolio
{
    public partial class Portfolio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAboutContent();
                LoadServices();
                LoadPortfolio();
            }
        }
        private void LoadAboutContent()
        {
            string connString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connString))
            {
                string query = "SELECT TOP 1 Title, Content FROM About ORDER BY AboutID DESC"; // latest entry
                SqlCommand cmd = new SqlCommand(query, con);

                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        reader.Read();
                        lblAboutTitle.Text = reader["Title"].ToString();
                        lblAboutContent.Text = reader["Content"].ToString();
                    }

                    reader.Close();
                }
                catch (Exception ex)
                {
                    lblAboutTitle.Text = "Error loading content";
                    lblAboutContent.Text = ex.Message;
                }
            }
        }
        private void LoadServices()
        {
            string connString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connString))
            {
                string query = "SELECT ServiceName, Description FROM Services ORDER BY ServiceID";
                SqlCommand cmd = new SqlCommand(query, con);

                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    rptServices.DataSource = reader;
                    rptServices.DataBind();
                    reader.Close();
                }
                catch
                {
                    // handle error
                }
            }
        }
        private void LoadPortfolio()
        {
            string connString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connString))
            {
                string query = "SELECT ProjectName, Description, ImageUrl, ProjectLink FROM latest_p ORDER BY ProjectID DESC";
                SqlCommand cmd = new SqlCommand(query, con);

                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    rptPortfolio.DataSource = reader;
                    rptPortfolio.DataBind();
                    reader.Close();
                }
                catch
                {
                    // handle error
                }
            }
        }



        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            // Example check (replace with DB check)
            if (email == "admin@gmail.com" && password == "1234")
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Login successful!";
                Response.Redirect("admin.aspx"); // Your admin panel page
            }
            else
            {
                lblMessage.Text = "Invalid email or password!";
            }
        }
        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtContactEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string subject = txtSubject.Text.Trim();
            string message = txtMessage.Text.Trim();

            if (name == "" || email == "" || message == "")
            {
                lblContactMessage.Text = "Name, Email, and Message are required!";
                lblContactMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connString))
            {
                string query = "INSERT INTO Contact (Name, Email, Phone, Subject, Message) VALUES (@Name, @Email, @Phone, @Subject, @Message)";
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Phone", string.IsNullOrEmpty(phone) ? (object)DBNull.Value : phone);
                cmd.Parameters.AddWithValue("@Subject", string.IsNullOrEmpty(subject) ? (object)DBNull.Value : subject);
                cmd.Parameters.AddWithValue("@Message", message);

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblContactMessage.Text = "Message sent successfully!";
                    lblContactMessage.ForeColor = System.Drawing.Color.Green;

                    // Clear fields
                    txtName.Text = "";
                    txtContactEmail.Text = "";
                    txtPhone.Text = "";
                    txtSubject.Text = "";
                    txtMessage.Text = "";
                }
                catch (Exception ex)
                {
                    lblContactMessage.Text = "Error sending message: " + ex.Message;
                    lblContactMessage.ForeColor = System.Drawing.Color.Red;
                }
            }

        }
    }
}

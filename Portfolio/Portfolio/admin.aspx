<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Portfolio.admin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="adminstyle.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="admin-wrapper">
             <h2 class="logo">Admin</h2>
            <!-- Sidebar -->
            <div class="sidebar">
                <ul>
                    <li><a href="#dashboard"><i class="fa-solid fa-gauge"></i> Dashboard</a></li>
                    <li><a href="#portfolio"><i class="fa-solid fa-briefcase"></i> Portfolio</a></li>
                    <li><a href="#services"><i class="fa-solid fa-code"></i> Services</a></li>
                    <li><a href="#about"><i class="fa-solid fa-user"></i> About</a></li>
                    <li><a href="#contact"><i class="fa-solid fa-envelope"></i> Contact</a></li>
                    <li><a href="Portfolio.aspx"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
                </ul>
            </div>

            <!-- Main Content -->
            <div class="main-content">
                <header>
                    <h2>Welcome, Newaz Mohammad hamim</h2>
                </header>

                <section id="dashboard" class="content-section">
                    <h3>Dashboard</h3>
                    <p>Here I can manage all aspects of my portfolio website quickly and efficiently. From this dashboard</p>
                </section>

               <!-- ✅ Portfolio Section -->
    <section id="portfolio">
<h3>Manage <span>Portfolio</span></h3>
<asp:TextBox ID="txtProjectName" runat="server" CssClass="input-box" Placeholder="Project Name"></asp:TextBox>
<asp:TextBox ID="txtProjectDesc" runat="server" CssClass="input-box" Placeholder="Project Description"></asp:TextBox>
<asp:TextBox ID="txtProjectImage" runat="server" CssClass="input-box" Placeholder="Image URL"></asp:TextBox>
<asp:TextBox ID="txtProjectLink" runat="server" CssClass="input-box" Placeholder="Project Link"></asp:TextBox>

<asp:Button ID="btnAddProject" runat="server" Text="Add Project" CssClass="btn" OnClick="btnAddProject_Click" />
<br />

<asp:GridView ID="gvProjects" runat="server" AutoGenerateColumns="False" DataKeyNames="ProjectID"
    OnRowEditing="gvProjects_RowEditing" OnRowUpdating="gvProjects_RowUpdating"
    OnRowCancelingEdit="gvProjects_RowCancelingEdit" OnRowDeleting="gvProjects_RowDeleting">
    <Columns>
        <asp:BoundField DataField="ProjectID" HeaderText="ID" ReadOnly="True" />
        <asp:BoundField DataField="ProjectName" HeaderText="Project Name" />
        <asp:BoundField DataField="Description" HeaderText="Description" />
        <asp:BoundField DataField="ImageUrl" HeaderText="Image URL" />
        <asp:BoundField DataField="ProjectLink" HeaderText="Project Link" />
        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
    </Columns>
</asp:GridView>

<hr />
        </section>
<!-- ✅ Services Section -->
                <section id="services">
<h3>Manage Services</h3>
<asp:TextBox ID="txtServiceName" runat="server" CssClass="input-box" Placeholder="Service Name"></asp:TextBox>
<asp:TextBox ID="txtServiceDesc" runat="server" CssClass="input-box" Placeholder="Service Description"></asp:TextBox>
<asp:Button ID="btnAddService" runat="server" Text="Add Service" CssClass="btn" OnClick="btnAddService_Click" />
<br /><asp:GridView ID="gvServices" runat="server" AutoGenerateColumns="False" DataKeyNames="ServiceID"
    OnRowEditing="gvServices_RowEditing" OnRowUpdating="gvServices_RowUpdating"
    OnRowCancelingEdit="gvServices_RowCancelingEdit" OnRowDeleting="gvServices_RowDeleting">
    <Columns>
        <asp:BoundField DataField="ServiceID" HeaderText="ID" ReadOnly="True" />
        <asp:BoundField DataField="ServiceName" HeaderText="Service Name" />
        <asp:BoundField DataField="Description" HeaderText="Description" />
        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
    </Columns>
</asp:GridView>
<hr />
</section>
<!-- ✅ About Section -->
                 <section id="about">
<h3>Manage About</h3>
<asp:TextBox ID="txtAboutTitle" runat="server" CssClass="input-box" Placeholder="Title"></asp:TextBox>
<asp:TextBox ID="txtAboutContent" runat="server" CssClass="input-box" TextMode="MultiLine" Rows="3" Placeholder="Content"></asp:TextBox>
<asp:Button ID="btnAddAbout" runat="server" Text="Add About Info" CssClass="btn" OnClick="btnAddAbout_Click" />
<br /><asp:GridView ID="gvAbout" runat="server" AutoGenerateColumns="False" DataKeyNames="AboutID"
    OnRowEditing="gvAbout_RowEditing" OnRowUpdating="gvAbout_RowUpdating"
    OnRowCancelingEdit="gvAbout_RowCancelingEdit" OnRowDeleting="gvAbout_RowDeleting">
    <Columns>
        <asp:BoundField DataField="AboutID" HeaderText="ID" ReadOnly="True" />
        <asp:BoundField DataField="Title" HeaderText="Title" />
        <asp:BoundField DataField="Content" HeaderText="Content" />
        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
    </Columns>
</asp:GridView>
<hr />
</section>
<!-- ✅ Contact Section -->
                 <section id="contact">
<h3>Manage Contact Messages</h3>
<asp:GridView ID="gvContact" runat="server" AutoGenerateColumns="False" DataKeyNames="ContactID"
    OnRowDeleting="gvContact_RowDeleting">
    <Columns>
        <asp:BoundField DataField="ContactID" HeaderText="ID" ReadOnly="True" />
        <asp:BoundField DataField="Name" HeaderText="Name" />
        <asp:BoundField DataField="Email" HeaderText="Email" />
        <asp:BoundField DataField="Message" HeaderText="Message" />
        <asp:CommandField ShowDeleteButton="True" />
    </Columns>
</asp:GridView>
                     </section>
            </div>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Portfolio.aspx.cs" Inherits="Portfolio.Portfolio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="StyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
        <header class="header">
            <a href="#" class="logo">Porfolio</a>
            <i class="fa-solid fa-bars" id="menu"></i>
            <nav class="navbar">
                <a href="#home">Home</a>
                <a href="#about">About</a>
                <a href="#service">Service</a>
                <a href="#portfolio">Portfolio</a>
                <a href="#contact">Contact</a>
                 <a href="#admin">Admin</a>

            </nav>
        </header>
        <section class="home" id="home">
            <div class="home-content">
                <h3>Hello,It's me</h3>
                <h1>Newaz Mohammad Hamim</h1>
                <h3>A passionate <span>Web Developer & Problem Solver</span></h3>
                <p> I design and build modern, responsive, and user-friendly websites.
With a strong foundation in ASP.NET, SQL Server, and Web Technologies,
I love turning ideas into reality through clean and efficient code.</p>
            
                <a href="CV_Template.pdf"  class="btn">Download CV</a>
            </div>
            <div class="home-img">
             <img src="home-img.jpg" alter=""/>
            </div>
        </section>
        <section class="about" id="about">
    <div class="about-container">
        <h2 class="heading">About <span>Me</span></h2>

        <!-- Single entry using Labels -->
        <div class="about-card">
            <div class="about-img">
                <img src="about-img.jpg" alt="About Me" />
            </div>
            <div class="about-content">
                <asp:Label ID="lblAboutTitle" runat="server" CssClass="about-title"></asp:Label>
                <asp:Label ID="lblAboutContent" runat="server" CssClass="about-text"></asp:Label>
            </div>
        </div>
    </div>
</section>

       <section class="service" id="service">
    <h2 class="heading">Our <span>Services</span></h2>
    <div class="service-container">
        <asp:Repeater ID="rptServices" runat="server">
            <ItemTemplate>
                <div class="service-box">
                    <i class="fa-solid fa-code"></i> <!-- optional icon -->
                    <h3><%# Eval("ServiceName") %></h3>
                    <p><%# Eval("Description") %></p>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</section>

        <section class="portfolio" id="portfolio">
    <h2 class="heading">Latest <span>Projects</span></h2>
    <div class="portfolio-container">
        <asp:Repeater ID="rptPortfolio" runat="server">
            <ItemTemplate>
                <div class="portfolio-box">
                    <img src='<%# Eval("ImageUrl") %>' alt="Project Image" />
                    <div class="portfolio-layer">
                        <h4><%# Eval("ProjectName") %></h4>
                        <p><%# Eval("Description") %></p>
                        <a href='<%# Eval("ProjectLink") %>'><i class="fa-solid fa-up-right-from-square"></i></a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</section>

    
<!-- Contact Section -->
<section class="contact" id="contact">
    <h2 class="heading">Contact <span>Me!</span></h2>
    <div class="contact-container">
        <!-- Contact Info -->
        <div class="contact-info">
            <div class="contact-item">
                <i class="fa-solid fa-phone"></i>
                <div class="contact-details">
                    <h4>Phone</h4>
                    <p>+880 1930337802</p>
                </div>
            </div>
            <div class="contact-item">
                <i class="fa-solid fa-envelope"></i>
                <div class="contact-details">
                    <h4>Email</h4>
                    <p>newazmohammedhamim@gmail.com</p>
                </div>
            </div>
            <div class="contact-item">
                <i class="fa-solid fa-location-dot"></i>
                <div class="contact-details">
                    <h4>Address</h4>
                    <p>Assasun,Satkhira, Bangladesh</p>
                </div>
            </div>
            <div class="contact-item">
                <i class="fa-solid fa-globe"></i>
                <div class="contact-details">
                    <h4>Website</h4>
                    <p>www.hamimportfolio.com</p>
                </div>
            </div>
        </div>

        <!-- Contact Form -->
        <div class="contact-form">
    <h3>Send Me a Message</h3>
    <div class="input-group">
        <asp:TextBox ID="txtName" runat="server" CssClass="input-box" Placeholder="Your Name"></asp:TextBox>
        <asp:TextBox ID="txtContactEmail" runat="server" CssClass="input-box" Placeholder="Your Email"></asp:TextBox>
    </div>
    <div class="input-group">
        <asp:TextBox ID="txtSubject" runat="server" CssClass="input-box" Placeholder="Subject"></asp:TextBox>
        <asp:TextBox ID="txtPhone" runat="server" CssClass="input-box" Placeholder="Your Phone"></asp:TextBox>
    </div>
    <asp:TextBox ID="txtMessage" runat="server" CssClass="input-box message-box" TextMode="MultiLine" Rows="6" Placeholder="Your Message"></asp:TextBox>
    <asp:Button ID="btnSendMessage" runat="server" CssClass="btn send-btn" Text="Send Message" OnClick="btnSendMessage_Click" />
    <asp:Label ID="lblContactMessage" runat="server" CssClass="contact-status"></asp:Label>
</div>

    </div>

    <!-- Social Media Section -->
    <div class="contact-social">
        <h3>Follow Me On</h3>
        <div class="social-links">
            <a href="https://www.facebook.com/newaz.mohammad.hamim/" class="social-link">
                <i class="fa-brands fa-facebook"></i>
                <span>Facebook</span>
            </a>
            <a href="https://www.linkedin.com/in/newaz-mohammed-hamim-196888254/" class="social-link">
                <i class="fa-brands fa-linkedin"></i>
                <span>LinkedIn</span>
            </a>
            <a href="https://github.com/newaz234" class="social-link">
                <i class="fa-brands fa-github"></i>
                <span>GitHub</span>
            </a>
            <a href="https://www.instagram.com/newazhamim/" class="social-link">
                <i class="fa-brands fa-instagram"></i>
                <span>Instagram</span>
            </a>
            <a href="https://codeforces.com/profile/newaz234" class="social-link">
               <i class="fa-solid fa-file-code"></i>
                <span>Codeforces</span>
            </a>
             <a href="https://x.com/NewazHamim" class="social-link">
                <i class="fa-brands fa-twitter"></i>
                <span>Twitter</span>
            </a>
        </div>
    </div>
</section>

<!-- Admin Section -->
<section class="admin" id="admin">
    <div class="admin-container">
        <h2 class="heading">Admin <span>Login</span></h2>
        <div class="admin-form">
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input-box" Placeholder="Enter Email"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="input-box" TextMode="Password" Placeholder="Enter Password"></asp:TextBox>
            <asp:Button ID="btnLogin" runat="server" CssClass="btn" Text="Login" OnClick="btnLogin_Click" />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </div>
</section>

 </form>
</body>
</html>

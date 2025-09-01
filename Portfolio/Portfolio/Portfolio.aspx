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
                <a href="#home" class="active">Home</a>
                <a href="#about">About</a>
                <a href="#service">Service</a>
                <a href="#portfolio">Portfolio</a>
                <a href="#contact">Contact</a>

            </nav>
        </header>
        <section class="home" id="home">
            <div class="home-content">
                <h3>Hello,It's me</h3>
                <h1>Newaz Mohammad Hamim</h1>
                <h3>And I'm a <span>Fronted developer</span></h3>
                <p> I am a beginner</p>
                <div class="social-media">
                    <a href="#"><i class="fa-brands fa-facebook"></i></a>
                    <a href="#"><i class="fa-brands fa-square-x-twitter"></i></a>
                    <a href="#"><i class="fa-brands fa-square-instagram"></i></a>
                    <a href="#"><i class="fa-brands fa-linkedin"></i></a>
                </div>
                <a href="#" class="btn">Download CV</a>
            </div>
            <div class="home-img">
             <img src="profile-pic.jpg" alter=""/>
            </div>
        </section>
    </form>
</body>
</html>

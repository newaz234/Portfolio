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
             <img src="home-img.jpg" alter=""/>
            </div>
        </section>
        <section class="about" id="about">
            <div class="home-img">
                <img src="about-img.jpg" />
            </div>
            <div class="about-content">
                <h2 class="heading">about <span>me</span></h2>
                <h3>Frontend developer</h3>
                <p>I am full stack developer. Currently I am an undergraduate student</p>
                <a href="#" class="btn">Read more</a>
            </div>
        </section>
        <section class="service" id="service">
            <h2 class="heading">Our <span>Services</span></h2>
            <div class="service-container">
                <div class="service-box">
                    <i class="fa-solid fa-paintbrush"></i>
                    <h3>Graphics design</h3>
                    <p>I design creative and professional visuals including logos, banners, posters, and social media graphics to make your brand stand out.</p>
                   <a href="#" class="btn">Read more</a>
                </div>
                <div class="service-box">
                    <i class="fa-solid fa-code"></i>
                    <h3>Web development</h3>
                    <p>I build modern, responsive, and user-friendly websites tailored to your needs. Clean design, smooth functionality, and SEO-friendly structure for a powerful online presence.</p>
                   <a href="#" class="btn">Read more</a>
                </div>
            </div>
        </section>
        <section class="portfolio" id="portfolio">
            <h2 class="heading">latest <span>Porject</span></h2>
            <div class="portfolio-container">
                <div class="portfolio-box">
                    <img src="web-img.jpg" />
                    <div class="portfolio-layer">
                        <h4> portfolio design</h4>
                        <p>Design my own portflio using asp.net framework</p>
                        <a href="#"><i class="fa-solid fa-up-right-from-square"></i></a>

                    </div>
                </div>
                 <div class="portfolio-box">
                    <img src="clock-img.jpg" />
                    <div class="portfolio-layer">
                        <h4> Digital clock design</h4>
                        <p>Design ditital clock using mone nei</p>
                        <a href="#"><i class="fa-solid fa-up-right-from-square"></i></a>

                    </div>
                </div>
                 <div class="portfolio-box">
                    <img src="web-img.jpg" />
                    <div class="portfolio-layer">
                        <h4> portfolio design</h4>
                        <p>Design my own portflio using asp.net framework</p>
                        <a href="#"><i class="fa-solid fa-up-right-from-square"></i></a>

                    </div>
                </div>
                 <div class="portfolio-box">
                    <img src="web-img.jpg" />
                    <div class="portfolio-layer">
                        <h4> portfolio design</h4>
                        <p>Design my own portflio using asp.net framework</p>
                        <a href="#"><i class="fa-solid fa-up-right-from-square"></i></a>

                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>

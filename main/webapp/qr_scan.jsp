<%-- 
    Document   : qr_scan
    Created on : Jun 23, 2021, 9:13:32 PM
    Author     : user2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="https://www.rawgit.com/schmich/instascan-builds/master/instascan.min.js"></script>
        <link rel="stylesheet" href="css/all.min.css">
        <title>JSP Page</title>
        <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: sans-serif;
        }

        img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        body {
            background-image: url(images/img1.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            height: 100vh;
        }

        #main-container {
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 0.5rem 0;
        }

        #video-container {
            width: 26rem;
            height: 26rem;
            /* 24 for smaller devices */
            margin-top: 1.5rem;
            position: relative;
        }

        #four-corner {
            position: absolute;
            top: 4.5rem;
            left: 4.5rem;
            right: 4.5rem;
            bottom: 4.5rem;
            background: linear-gradient(to left, rgba(250, 250, 250, 0.794), rgba(250, 250, 250, 0.794)) left top no-repeat,
                linear-gradient(to bottom, rgba(250, 250, 250, 0.794), rgba(250, 250, 250, 0.794)) left top no-repeat,
                linear-gradient(to left, rgba(250, 250, 250, 0.794), rgba(250, 250, 250, 0.794)) right top no-repeat,
                linear-gradient(to bottom, rgba(250, 250, 250, 0.794), rgba(250, 250, 250, 0.794)) right top no-repeat,
                linear-gradient(to left, rgba(250, 250, 250, 0.794), rgba(250, 250, 250, 0.794)) left bottom no-repeat,
                linear-gradient(to bottom, rgba(250, 250, 250, 0.794), rgba(250, 250, 250, 0.794)) left bottom no-repeat,
                linear-gradient(to left, rgba(250, 250, 250, 0.794), rgba(250, 250, 250, 0.794)) right bottom no-repeat,
                linear-gradient(to left, rgba(250, 250, 250, 0.794), rgba(250, 250, 250, 0.794)) right bottom no-repeat;
            background-size: 1px 20px, 20px 1px, 1px 20px, 20px 1px;
        }

        @keyframes animate-scan {
            from {
                top: 4.55rem
            }

            to {
                top: 21.2rem
            }
        }

        @-webkit-keyframes animate-scan {
            from {
                top: 4.55rem
            }

            to {
                top: 21.2rem
            }
        }

        #scan-animation {
            background-color: rgba(255, 255, 255, 0.3);
            position: absolute;
            top: 4.55rem;
            left: 4.6rem;
            right: 4.6rem;
            height: 4px;
            animation-timing-function: linear;
            animation-name: animate-scan;
            animation-duration: 7s;
            animation-iteration-count: infinite;
            animation-direction: alternate;
            border-radius: 50px;
        }

        #video-container:after {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            border: 4.5rem solid rgba(0, 0, 0, 0.4);
        }

        #video {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        #options {
            background-color: rgba(35, 141, 211, 0.555);
            width: 24rem;
            height: 3.5rem;
            margin-top: 1.5rem;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #options button a {
            color: white;
            font-size: 1.3rem;
        }

        #options button {
            background: none;
            border: none;
            margin: 0 1.5rem;
            color: white;
            font-size: 1.3rem;
            transition: 0.2s;
            width: 2rem;
            height: 2rem;
        }

        #options button:hover {
            transform: scale(1.1);
        }

        #options button:nth-child(2) {
            background-color: white;
            border-radius: 50%;
            width: 2.5rem;
            height: 2.5rem;
            color: rgba(35, 141, 211, 0.555);
        }

        #logo-con {
            height: 5rem;
            width: 5rem;
            margin: 1rem;

        }

        @media screen and (max-width: 480px) {
            #video-container {
                width: 22rem;
                height: 22rem;
            }

            @keyframes animate-scan {
                from {
                    top: 4.55rem
                }

                to {
                    top: 17.3rem
                }
            }

            @-webkit-keyframes animate-scan {
                from {
                    top: 4.55rem
                }

                to {
                    top: 17.3rem
                }
            }

            #options {
                width: 20rem;
            }
        }

        @media screen and (max-width: 360px) {
            #video-container {
                width: 20rem;
                height: 20rem;
            }

            @keyframes animate-scan {
                from {
                    top: 4.55rem
                }

                to {
                    top: 15.3rem
                }
            }

            @-webkit-keyframes animate-scan {
                from {
                    top: 4.55rem
                }

                to {
                    top: 15.3rem
                }
            }

            #options {
                width: 20rem;
            }
        }
    </style>
    </head>
    <body>
        <div id="main-container">
        <div id="video-container">
            <video src="" id="video"></video>
            <div id="scan-animation"></div>
            <div id="four-corner"></div>
        </div>
        <div id="logo-con">
            <img src="images/delsu_logo.png" alt="" id="logo">
        </div>
        <div id="options">
            <!-- cancel, view/verify, enter code manually -->
            <button><a href="index.html"><i class="fas fa-times"></i></a></button>
            <button><i class="fas fa-list"></i></button>
            <button><i class="fas fa-pen"></i></button>
        </div>
    </div>
        

        <form action="/CertificateQrScanner/verifyCertificateNumber" method="get" id="certificate_info">
            <input type="text" name="certificate_number" id="certificate_number" hidden>
        </form>
    <script>
        let scanner = new Instascan.Scanner({ video: document.getElementById("video") });
        let certificateNumber = document.getElementById("certificate_number");
        let certificateForm = document.getElementById("certificate_info");
        scanner.addListener('scan', function (content) {
            console.log(content);
            certificateNumber.value = content;
            certificateForm.submit();
        });
        Instascan.Camera.getCameras().then(function (cameras) {
            if (cameras.length > 0) {
                scanner.start(cameras[0]);
            } else {
                console.error("No cameras found");
            }
        }).catch(function (e) {
            console.error(e);
        });
    </script>
    </body>
</html>

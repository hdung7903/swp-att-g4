<%-- 
    Document   : sessiondetail
    Created on : Feb 19, 2024, 2:57:13 PM
    Author     : Admin
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Session Information</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .container-fluid{
                margin: 0!important;
                padding: 0!important;
            }
            .navbar {
                box-shadow: 0 2px 4px rgba(0,0,0,.1);
            }
            .container {
                margin-top: 20px;
            }
            .table-container {
                background-color: white;
                border-radius: 15px;
                box-shadow: 0 2px 4px rgba(0,0,0,.1);
                padding: 20px;
                margin-bottom: 20px;
            }
            .table th, .table td {
                vertical-align: middle;
            }
            .table th {
                background-color: #007bff;
                color: white;
            }
            .table-striped tbody tr:nth-of-type(odd) {
                background-color: rgba(0, 0, 0, 0.05);
            }
            .table-bordered th, .table-bordered td {
                border: 1px solid #dee2e6;
            }
            .container-fluid{
                margin: 0!important;
                padding: 0!important;
            }
        </style>
    </head>
    <body> 
        <div class="container-fluid">
            <%@include file="./navbar.jsp" %>
            <div style="width: 1280px; height: 832px; position: relative; background: white">

                <div style="width: 986px; height: 633px; padding: 36px; left: 240px; top: 64px; position: absolute; background: white; box-shadow: 12px 12px 20px rgba(0, 0, 0, 0.10); border-radius: 48px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 24px; display: inline-flex">
                    <div style="padding-top: 1.98px; padding-right: 193.62px; justify-content: flex-start; align-items: flex-start; gap: 3.59px; display: inline-flex">
                        <div style="width: 24px; height: 24px; position: relative">
                            <div style="width: 24px; height: 24px; left: 0px; top: 0px; position: absolute">
                                <div style="width: 20.49px; height: 19.48px; left: 0px; top: 0px; position: absolute; background: white"></div>
                            </div>
                        </div>
                        <div style="width: 24px; height: 24px; position: relative">
                            <div style="width: 24px; height: 24px; left: 0px; top: 0px; position: absolute">
                                <div style="width: 20.49px; height: 19.48px; left: 0px; top: 0px; position: absolute; background: white"></div>
                            </div>
                        </div>
                        <div style="width: 24px; height: 24px; position: relative">
                            <div style="width: 24px; height: 24px; left: 0px; top: 0px; position: absolute">
                                <div style="width: 20.49px; height: 19.48px; left: 0px; top: 0px; position: absolute; background: white"></div>
                            </div>
                        </div>
                        <div style="width: 24px; height: 24px; position: relative">
                            <div style="width: 24px; height: 24px; left: 0px; top: 0px; position: absolute">
                                <div style="width: 20.49px; height: 19.48px; left: 0px; top: 0px; position: absolute; background: white"></div>
                            </div>
                        </div>
                        <div style="width: 24px; height: 24px; position: relative">
                            <div style="width: 24px; height: 24px; left: 0px; top: 0px; position: absolute">
                                <div style="width: 20.49px; height: 19.48px; left: 0px; top: 0px; position: absolute; background: white"></div>
                            </div>
                        </div>
                    </div>
                    <div style="color: #02033B; font-size: 25px; font-family: Inter; font-weight: 800; line-height: 20px; word-wrap: break-word">Instructor</div>
                    <div style="width: 440px; height: 48px; position: relative">
                        <div style="width: 440px; height: 48px; left: 0px; top: 0px; position: absolute; border-radius: 32px; border: 1px #9B99AF solid">
                            <div style="width: 355px; padding-right: 190px; left: 25px; top: 11.02px; position: absolute; justify-content: flex-start; align-items: flex-start; display: inline-flex">
                                <div style="color: black; font-size: 18px; font-family: Inter; font-weight: 400; word-wrap: break-word">${requestScope.ses.instructor.name}</div>
                                <div style="width: 10px; height: 10px; position: relative"></div>
                            </div>
                            <div style="width: 12px; height: 8px; left: 397px; top: 20.02px; position: absolute"></div>
                        </div>
                    </div>
                    <div style="color: #02033B; font-size: 25px; font-family: Inter; font-weight: 800; line-height: 20px; word-wrap: break-word">Course</div>
                    <div style="width: 440px; height: 48px; position: relative">
                        <div style="width: 440px; height: 48px; left: 0px; top: 0px; position: absolute; border-radius: 32px; border: 1px #9B99AF solid">
                            <div style="width: 355px; padding-right: 190px; left: 25px; top: 11.02px; position: absolute; justify-content: flex-start; align-items: flex-start; display: inline-flex">
                                <div style="color: black; font-size: 18px; font-family: Inter; font-weight: 400; word-wrap: break-word">${requestScope.ses.subject.name}</div>
                                <div style="width: 10px; height: 10px; position: relative"></div>
                            </div>
                            <div style="width: 12px; height: 8px; left: 397px; top: 20.02px; position: absolute"></div>
                        </div>
                    </div>
                    <div style="color: #02033B; font-size: 25px; font-family: Inter; font-weight: 800; line-height: 20px; word-wrap: break-word">Class</div>
                    <div style="width: 440px; height: 48px; position: relative">
                        <div style="width: 440px; height: 48px; left: 0px; top: 0px; position: absolute; border-radius: 32px; border: 1px #9B99AF solid">
                            <div style="width: 355px; padding-right: 190px; left: 25px; top: 11.02px; position: absolute; justify-content: flex-start; align-items: flex-start; display: inline-flex">
                                <div style="color: black; font-size: 18px; font-family: Inter; font-weight: 400; word-wrap: break-word">
                                    <a href="${pageContext.request.contextPath}/student/studentlist?csm_id=${requestScope.ses.gsm.id}" class="font-weight-bold text-dark">
                                    ${requestScope.ses.group.name}</a>
                                </div>
                                <div style="width: 10px; height: 10px; position: relative"></div>
                            </div>
                            <div style="width: 12px; height: 8px; left: 397px; top: 20.02px; position: absolute"></div>
                        </div>
                    </div>
                    <div style="color: #02033B; font-size: 25px; font-family: Inter; font-weight: 800; line-height: 20px; word-wrap: break-word">Time Description</div>
                    <div style="width: 440px; height: 48px; position: relative">
                        <div style="width: 440px; height: 48px; left: 0px; top: 0px; position: absolute; border-radius: 32px; border: 1px #9B99AF solid">
                            <div style="width: 355px; padding-right: 190px; left: 25px; top: 11.02px; position: absolute; justify-content: flex-start; align-items: flex-start; display: inline-flex">
                                <div style="color: black; font-size: 18px; font-family: Inter; font-weight: 400; word-wrap: break-word">${requestScope.ses.time.description}</div>
                                <div style="width: 10px; height: 10px; position: relative"></div>
                            </div>
                            <div style="width: 12px; height: 8px; left: 397px; top: 20.02px; position: absolute"></div>
                        </div>
                    </div>
                    <div style="color: #02033B; font-size: 25px; font-family: Inter; font-weight: 800; line-height: 20px; word-wrap: break-word">Link</div>
                    <div style="width: 440px; height: 48px; position: relative">
                        <div style="width: 440px; height: 48px; left: 0px; top: 0px; position: absolute; border-radius: 32px; border: 1px #9B99AF solid">
                            <div style="width: 355px; padding-right: 190px; left: 25px; top: 11.02px; position: absolute; justify-content: flex-start; align-items: flex-start; display: inline-flex">
                                <div style="color: black; font-size: 18px; font-family: Inter; font-weight: 400; word-wrap: break-word"><a href="https://${requestScope.ses.group.link_url}" target="_blank">Link Meet</a></div>
                                <div style="width: 10px; height: 10px; position: relative"></div>
                            </div>
                            <div style="width: 12px; height: 8px; left: 397px; top: 20.02px; position: absolute"></div>
                        </div>
                    </div>            

                </div>
                <div style="width: 986px; padding-top: 19px; padding-bottom: 21px; padding-left: 45.03px; padding-right: 49.97px; left: 240px; top: 61px; position: absolute; background: linear-gradient(90deg, rgba(21, 72, 132, 0.94) 0%, rgba(21, 72, 132, 0.69) 100%); border-radius: 100px; justify-content: center; align-items: center; display: inline-flex">
                    <div style="text-align: center; color: white; font-size: 30px; font-family: Inter; font-weight: 800; line-height: 20px; word-wrap: break-word">Session Information</div>
                </div>

            </div>
        </div>
    </body>
</html>
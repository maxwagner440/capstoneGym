<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
    <meta charset="utf-8"> <!-- utf-8 works for most cases -->
    <meta name="viewport" content="width=device-width"> <!-- Forcing initial-scale shouldn't be necessary -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> <!-- Use the latest (edge) version of IE rendering engine -->
    <meta name="x-apple-disable-message-reformatting">  <!-- Disable auto-scale in iOS 10 Mail entirely -->
    <title></title> <!-- The title tag shows in email notifications, like Android 4.4. -->

    <!-- Web Font / @font-face : BEGIN -->
    <!-- Desktop Outlook chokes on web font references and defaults to Times New Roman, so we force a safe fallback font. -->
    <!--[if mso]>
        <style>
            * {
                font-family: sans-serif !important;
            }
        </style>
    <![endif]-->

    <!-- All other clients get the webfont reference; some will render the font and others will silently fail to the fallbacks. More on that here: http://stylecampaign.com/blog/2015/02/webfont-support-in-email/ -->
    <!--[if !mso]><!-->
    <!-- insert web font reference, eg: <link href='https://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'> -->
    <!--<![endif]-->

    <!-- Web Font / @font-face : END -->

    <!-- CSS Reset : BEGIN -->
    <style>
.toUser {
    font-family: "open sans";
    font-size: 12pt;
    border: 2px inset #1d4189;
    padding: .5em;
    height: 10%;
    width: 40%;
}
.messagearea {
    font-family: "open sans";
    font-size: 14pt;
    border: 2px inset #1d4189;
    padding: .5em;
    box-sizing: border-box;	
    width: 100%;
    height: 50%;
}

        /* What it does: Remove spaces around the email design added by some email clients. */
        html,
        body {
            margin: 50px auto !important; padding: 50px !important;
            height: 100% !important; width: 90% !important;
        }
        /* What it does: Stops email clients resizing small text. */
        * {
            -ms-text-size-adjust: 100%;
            -webkit-text-size-adjust: 100%;
        }
        /* What it does: Centers email on Android 4.4 */
        div[style*="margin: 16px 0"] {
            margin: 0 !important;
        }
        /* What it does: Stops Outlook from adding extra spacing to tables. */
        table,
        td {
            mso-table-lspace: 0pt !important; mso-table-rspace: 0pt !important;
        }
        /* What it does: Fixes webkit padding issue. Fix for Yahoo mail table alignment bug. Applies table-layout to the first 2 tables then removes for anything nested deeper. */
        table {
            border-spacing: 0 !important; border-collapse: collapse !important; table-layout: fixed !important;
            margin: 0 auto !important;
        }
        table table table {
            table-layout: auto;
        }
        /* What it does: Uses a better rendering method when resizing images in IE. */
        img {
            -ms-interpolation-mode:bicubic;
        }
        /* What it does: A work-around for email clients meddling in triggered links. */
        *[x-apple-data-detectors],  /* iOS */
        .x-gmail-data-detectors,    /* Gmail */
        .x-gmail-data-detectors *,
        .aBn {
            border-bottom: 0 !important; cursor: default !important; color: inherit !important; text-decoration: none !important;
            font-size: inherit !important; font-family: inherit !important; font-weight: inherit !important;
            line-height: inherit !important;
        }
        /* What it does: Prevents Gmail from displaying an download button on large, non-linked images. */
        .a6S {
            display: none !important; opacity: 0.01 !important;
        }
        /* If the above doesn't work, add a .g-img class to any image in question. */
        img.g-img + div {
            display: none !important;
        }
        /* What it does: Prevents underlining the button text in Windows 10 */
        .button-link {
            text-decoration: none !important;
        }
        /* What it does: Removes right gutter in Gmail iOS app: https://github.com/TedGoas/Cerberus/issues/89  */
        /* Create one of these media queries for each additional viewport size you'd like to fix */
        @media only screen and (min-device-width: 375px) and (max-device-width: 413px) { /* iPhone 6 and 6+ */
            .email-container {
                min-width: 375px !important;
            }
        }
        /* What it does: Forces Gmail app to display email full width */
        u ~ div .email-container {
	        min-width: 100vw;
        }
    </style>
    <!-- CSS Reset : END -->

    <!-- Progressive Enhancements : BEGIN -->
    <style>

    /* What it does: Hover styles for buttons */
    .button-td,
    .button-a {
        transition: all 100ms ease-in; }
    .button-td:hover,
    .button-a:hover {
        background: #555555 !important; border-color: #555555 !important;}
    /* Media Queries */
    @media screen and (max-width: 480px) {
        /* What it does: Forces elements to resize to the full width of their container. Useful for resizing images beyond their max-width. */
        .fluid {
            width: 100% !important; max-width: 100% !important; height: auto !important;
            margin-left: auto !important; margin-right: auto !important;}
        /* What it does: Forces table cells into full-width rows. */
        .stack-column,.stack-column-center {
            display: block !important; width: 100% !important; max-width: 100% !important; direction: ltr !important;}
        /* And center justify these ones. */
        .stack-column-center {text-align: center !important;}
        /* What it does: Generic utility class for centering. Useful for images, buttons, and nested tables. */
        .center-on-narrow {
            text-align: center !important; display: block !important; margin-left: auto !important; margin-right: auto !important;
            float: none !important;}
        table.center-on-narrow { display: inline-block !important;}
        /* What it does: Adjust typography on small screens to improve readability */
        .email-container p { font-size: 17px !important; }
    }

    </style>
    <!-- Progressive Enhancements : END -->

    <!-- What it does: Makes background images in 72ppi Outlook render at correct size. -->
    <!--[if gte mso 9]>
    <xml>
        <o:OfficeDocumentSettings>
            <o:AllowPNG/>
            <o:PixelsPerInch>96</o:PixelsPerInch>
        </o:OfficeDocumentSettings>
    </xml>
    <![endif]-->

</head>
<body width="100%" bgcolor="#57707d" style="margin: 0; mso-line-height-rule: exactly;">
    <center style="width: 100%; background: #57707d; text-align: left;">
        <!--
            Set the email width. Defined in two places:
            1. max-width for all clients except Desktop Windows Outlook, allowing the email to squish on narrow but never go wider than 680px.
            2. MSO tags for Desktop Windows Outlook enforce a 680px width.
            Note: The Fluid and Responsive templates have a different width (600px). The hybrid grid is more "fragile", and I've found that 680px is a good width. Change with caution.
        -->
        <div style="max-width: 680px; margin: auto;" class="email-container">
            <!--[if mso]>
            <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="680" align="center">
            <tr>
            <td>
            <![endif]-->

            <!-- Email Body : BEGIN -->
            <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" width="100%" style="max-width: 680px;" class="email-container">
                <!-- 1 Column Text + Button : BEGIN -->
                <tr>
                    <td bgcolor="#ffffff">
                        <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
                            <tr>
                                <td style="padding: 40px 40px 20px; text-align: center;">
                                    <h1 style="margin: 0; font-family: sans-serif; font-size: 24px; line-height: 125%; color: #333333; font-weight: normal;">Messages</h1>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 0 40px 40px; font-family: sans-serif; font-size: 15px; line-height: 140%; color: #555555; text-align: center;">
                                        <c:url var="sendMessage" value="/sendMessage"/>
  										<form action="${sendMessage}" method="POST">
                                               
                                                <textarea class="messagearea" name="message" placeholder="Your Comments Here..."></textarea>
                                                 <form action="${sendMessage}" method="POST">
												<input type="hidden" name="receiverId" value="${trainer.id}"/>
												<table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" style="margin: auto;">
                                        <tr>
                                            <br>
                                            <br><td style="border-radius: 3px; background: #222222; text-align: center;" class="button-td">
												<input type="submit" value="Send" style="color:#ffffff; background: #222222; border: 15px solid #222222; font-family: sans-serif; font-size: 13px; line-height: 110%; text-align: center; text-decoration: none; display: block; border-radius: 3px; font-weight: bold;"/>
                                            <span style="color:#ffffff;" class="button-link"></span>
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                           </form>
                                </td>
                            </tr>
                            
                    </td>
                </tr>
                <!-- 1 Column Text + Button : END -->

            </table>
            <!-- Email Body : END -->

            <!--[if mso]>
            </td>
            </tr>
            </table>
            <![endif]-->
        </div>

    </center>
</body>
</html>
import * as functions from 'firebase-functions';

const nodemailer = require('nodemailer');

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    type: 'OAuth2',
    user: functions.config().gmail.user,
    clientId: functions.config().gmail.clientid,
    clientSecret: functions.config().gmail.clientsecret,
    accessToken: functions.config().gmail.accesstoken,
    refreshToken: functions.config().gmail.refreshtoken,
    expires: 1484314697598
  }
});

exports.emailMessage = functions.https.onCall((data, context) => {
  const { name, email, subject, message } = data;

  const text = `<div>
    <h4>Demande de contact depuis le site <a href="https://com-valglo.web.app">ComValGlo</a></h4>
    <ul>
      <li>
        NOM Prénom - ${name || ""}
      </li>
      <li>
        Email - ${email || ""}
      </li>
      <li>
        Objet - ${subject || ""}
      </li>
    </ul>
    <h4>Message</h4>
    <p>${message || ""}</p>
  </div>`;

  const msg = {
    to: functions.config().comvalglo.contact.emailto,
    from: `ComValGlo site web <${functions.config().gmail.user}>`,
    subject: 'Demande de contact ComValGlo',
    html: text
  };

  return transporter.sendMail(msg)
    .catch((e: any) => {
    console.log(e);
      throw new functions.https.HttpsError('unknown', e.toString());
    });
});
//06 60 89 97 07
from flask import Flask, render_template,request,session,redirect
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
import json


with open('config.json','r' ) as c:
    params= json.load(c)["params"]


local_server= True
app = Flask(__name__)
app.secret_key='super-secret-key'
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gu'],
    MAIL_PASSWORD=  params['gp']
)
mail= Mail(app)



if (local_server):
    app.config ['SQLALCHEMY_DATABASE_URI'] = params ['local_url']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']
db= SQLAlchemy(app)


class Getquote(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    mobile = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    email = db.Column(db.String(20), nullable=False)



@app.route("/")
def home():
    return render_template('digital-agency.html',params=params)

@app.route("/services")
def logo_click():
    return render_template('index.html',params=params)

@app.route("/web-design-agency")
def web_design_agency():
    return render_template('web-design-agency.html',params=params)

@app.route("/app-development")
def app_development():
    return render_template('app-development.html',params=params)

@app.route("/get-quote", methods = ['GET','POST'])
def get_quote():
    if(request.method=='POST'):
        ''' Add Entry to the Database '''
        name=request.form.get('name')
        msg=request.form.get('msg')
        mobile=request.form.get('mobile')
        email=request.form.get('email')
        entry=Getquote(name=name,mobile=mobile,msg=msg,email=email)
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New Lead name is '+ name,
                          sender=email,
                          recipients = [params['gu']],
                          body= msg + "\n" + mobile + "\n" + email + "\n" + name
                          )

    return render_template('get-quote.html',params=params)


@app.route("/admin", methods= ['GET','POST'])
def admin():
    if ('user' in session and session['user']== params['admin_u']):
        posts =Getquote.query.all()
        return render_template('admin.html', params=params,posts=posts)

    if request.method=='POST':
        username= request.form.get('uname')
        userpass = request.form.get('pass')
        if (username==params['admin_u'] and userpass==params['admin_p']):
            #set the sesion variable
            session['user'] = username
            posts =Getquote.query.all()
            return render_template('admin.html',params=params,posts=posts)

    else:
        return render_template('login.html', params=params)

    return render_template('login.html', params=params)




@app.route("/logout")
def logout():
    session.pop ('user')
    return redirect('/login')



@app.route("/delete/<string:sno>" , methods=['GET', 'POST'])
def delete(sno):
    if "user" in session and session['user']==params['admin_u']:
        post =Getquote.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect("/admin")



@app.route("/getidea")
def getidea():
    return render_template('portfolio.html', params=params)

@app.route("/service")
def service():
    return render_template('service-web.html', params=params)

@app.route("/login")
def login():
    return render_template('login.html', params=params)



@app.route("/portfolio-details")
def portfolio ():
    return render_template('portfolio-details.html', params=params)



@app.route("/shop")
def shop ():
    return render_template('shop-page.html', params=params)

@app.route("/creative-agency")
def creative_agency ():
    return render_template('creative-agency.html', params=params)

@app.route("/digital-marketing")
def digital_marketing ():
    return render_template('digital-marketing.html', params=params)

@app.route("/business-and-startup")
def business_and_startup ():
    return render_template('business-and-startup.html', params=params)

@app.route("/shop-details")
def shop_details ():
    return render_template('shop-details.html', params=params)




app.run(debug=True)

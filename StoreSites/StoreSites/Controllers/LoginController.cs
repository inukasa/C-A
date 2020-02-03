using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using StoreSites.Models;

namespace StoreSites.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(UserLoginModels user, string returnURL)
        {
            if (IsValid(user))
            {
                using (Entities1 db1 = new Entities1())
                {
                    List<User> listU = db1.Users.ToList();
                    bool isUsername = false;
                    bool isPhone = false;
                    bool isEmail = false;
                    foreach (User us in listU)
                    {
                        if (us.username != null && us.username.Equals(user.username))
                        {
                            isUsername = true;
                        }
                        if (us.phone != null && us.phone.Equals(user.username))
                        {
                            isPhone = true;
                        }
                        if (us.email != null && us.email.Equals(user.username))
                        {
                            isEmail = true;
                        }
                    }
                    if (isUsername == true && isPhone == false && isEmail == false)
                    {
                        FormsAuthentication.SetAuthCookie(user.username, false);
                        Session["user"] = db1.Users.Where(b => b.username.Equals(user.username)).FirstOrDefault().fullname;
                        Session["username"] = user.username;
                    }
                    else if (isUsername == false && isPhone == true && isEmail == false)
                    {
                        FormsAuthentication.SetAuthCookie(user.username, false);
                        Session["user"] = db1.Users.Where(b => b.phone.Equals(user.username)).FirstOrDefault().fullname;
                        Session["username"] = db1.Users.Where(b => b.phone.Equals(user.username)).FirstOrDefault().username;
                    }
                    else if (isUsername == false && isPhone == false && isEmail == true)
                    {
                        FormsAuthentication.SetAuthCookie(user.username, false);
                        Session["user"] = db1.Users.Where(b => b.email.Equals(user.username)).FirstOrDefault().fullname;
                        Session["username"] = db1.Users.Where(b => b.email.Equals(user.username)).FirstOrDefault().username;
                    }
                    else if (isUsername == false && isPhone == false && isEmail == false)
                    {
                        ViewBag.ErrorMessege = "<script>alert('Sai username hoặc password');</script>";
                        return View();
                    }

                }


                return RedirectToAction("Index", "Products");
            }
            else
            {
                ViewBag.ErrorMessege = "<script>alert('Không có user');</script>";
                return View(user);
            }

        }
        public ActionResult LoginA()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LoginA(UserLoginModels user)
        {
            if (IsValid(user))
            {
                using (Entities1 db1 = new Entities1())
                {
                    List<User> listU = db1.Users.ToList();
                    bool isUsername = false;
                    bool isPhone = false;
                    bool isEmail = false;
                    foreach (User us in listU)
                    {
                        if (us.username != null && us.username.Equals(user.username))
                        {
                            isUsername = true;
                        }
                        if (us.phone != null && us.phone.Equals(user.username))
                        {
                            isPhone = true;
                        }
                        if (us.email != null && us.email.Equals(user.username))
                        {
                            isEmail = true;
                        }
                    }
                    if (isUsername == true && isPhone == false && isEmail == false)
                    {
                        FormsAuthentication.SetAuthCookie(user.username, false);
                        Session["user"] = db1.Users.Where(b => b.username.Equals(user.username)).FirstOrDefault().fullname;
                        Session["username"] = user.username;
                    }
                    else if (isUsername == false && isPhone == true && isEmail == false)
                    {
                        FormsAuthentication.SetAuthCookie(user.username, false);
                        Session["user"] = db1.Users.Where(b => b.phone.Equals(user.username)).FirstOrDefault().fullname;
                        Session["username"] = db1.Users.Where(b => b.phone.Equals(user.username)).FirstOrDefault().username;
                    }
                    else if (isUsername == false && isPhone == false && isEmail == true)
                    {
                        FormsAuthentication.SetAuthCookie(user.username, false);
                        Session["user"] = db1.Users.Where(b => b.email.Equals(user.username)).FirstOrDefault().fullname;
                        Session["username"] = db1.Users.Where(b => b.email.Equals(user.username)).FirstOrDefault().username;
                    }
                    else if (isUsername == false && isPhone == false && isEmail == false)
                    {
                        ViewBag.ErrorMessege = "<script>alert('Sai username hoặc password');</script>";
                        return View();
                    }

                }


                return RedirectToAction("Index", "Products");
            }
            else
            {
                ViewBag.ErrorMessege = "<script>alert('Không có user');</script>";
                return View(user);
            }

        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session["user"] = null;
            Session["username"] = null;
            return Redirect("/Products/Index");
        }
        private bool IsValid(UserLoginModels user)
        {
            bool flag = false;
            using (Entities1 db1 = new Entities1())
            {
                List<User> listU = db1.Users.ToList();
                var uLogin = new User();
                bool isUsername = false;
                bool isPhone = false;
                bool isEmail = false;
                foreach (User us in listU)
                {
                    if (us.username != null && us.username.Equals(user.username))
                    {
                        isUsername = true;
                    }
                    if (us.phone != null && us.phone.Equals(user.username))
                    {
                        isPhone = true;
                    }
                    if (us.email != null && us.email.Equals(user.username))
                    {
                        isEmail = true;
                    }
                }
                if (isUsername == true && isPhone == false && isEmail == false)
                {
                    if (db1.Users
                    .Where(b => b.username.Equals(user.username) && b.password.Equals(user.password))
                    .FirstOrDefault() != null)
                    {
                        uLogin = db1.Users.Where(b => b.username.Equals(user.username) && b.password.Equals(user.password)).FirstOrDefault();
                    }

                }
                else if (isUsername == false && isPhone == true && isEmail == false)
                {
                    if (db1.Users.Where(b => b.phone.Equals(user.username) && b.password.Equals(user.password)).FirstOrDefault() != null)
                    {
                        uLogin = db1.Users.Where(b => b.phone.Equals(user.username) && b.password.Equals(user.password)).FirstOrDefault();
                    }

                }
                else if (isUsername == false && isPhone == false && isEmail == true)
                {
                    if (db1.Users.Where(b => b.email.Equals(user.username) && b.password.Equals(user.password)).FirstOrDefault() != null)
                    {
                        uLogin = db1.Users.Where(b => b.email.Equals(user.username) && b.password.Equals(user.password)).FirstOrDefault();
                    }

                }
                if (uLogin != null)
                {
                    if (uLogin.status == null)
                    {
                        flag = false;
                    }
                    else if (uLogin.status.Equals("Active") && uLogin.typeID == 3)
                    {
                        flag = true;
                    }
                    else
                    {
                        flag = false;
                    }

                }
                else
                {
                    flag = false;
                }
            }
            return flag;
        }
        public ActionResult Register()
        {
            return View();

        }
        [HttpPost]
        public ActionResult Register(User user)
        {
            if (ModelState.IsValid)
            {
                if (user.username.Length > 50)
                {
                    ViewBag.ErrorMessege = "<script>alert('Nhấp tài khoản dài quá rồi má ưi, nhập lại dùm con');</script>";
                    return View();
                }
                else if (user.password.Length > 50)
                {
                    ViewBag.ErrorMessege = "<script>alert('Nhấp mật khẩu dài quá rồi má ưi, nhập lại dùm con');</script>";
                    return View();
                }
                else if (user.phone.Length > 10)
                {
                    ViewBag.ErrorMessege = "<script>alert('Nhấp sdt dài quá rồi má ưi, nhập lại dùm con');</script>";
                    return View();
                }
                else if (user.email.Length > 50)
                {
                    ViewBag.ErrorMessege = "<script>alert('Nhấp email dài quá rồi má ưi, nhập lại dùm con');</script>";
                    return View();
                }
                else if (user.address.Length > 50)
                {
                    ViewBag.ErrorMessege = "<script>alert('Nhấp địa chỉ dài quá rồi má ưi, nhập lại dùm con');</script>";
                    return View();
                }
                else
                {
                    using (Entities1 db = new Entities1())
                    {
                        List<User> listUser = db.Users.ToList();
                        bool flag = true;
                        foreach (User us in listUser)
                        {
                            if (us.email != null && us.phone != null && us.username != null)
                            {
                                if (user.email.ToLower().Equals(us.email.ToLower()) || user.email.ToLower().Equals(us.username.ToLower()) || user.phone.ToLower().Equals(us.username.ToLower()) || user.phone.ToLower().Equals(us.phone.ToLower()) || user.email.ToLower().Equals(us.phone.ToLower()) || user.phone.ToLower().Equals(us.email.ToLower()) || user.username.ToLower().Equals(us.email.ToLower()) || user.username.ToLower().Equals(us.phone.ToLower()) || user.username.ToLower().Equals(us.username.ToLower()))
                                {
                                    flag = false;
                                }
                            }
                        }
                        if (flag == true)
                        {
                            try
                            {
                                string currentDate = DateTime.Now.ToString("yyyy-MM-dd");
                                DateTime current = DateTime.ParseExact(currentDate, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                                DateTime birth = DateTime.ParseExact(user.birthday, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                                if (birth < current)
                                {
                                    user.userID = listUser[listUser.Count - 1].userID + 1;
                                    user.typeID = 3;
                                    user.email = user.email.ToLower();
                                    user.username = user.username.ToLower();
                                    user.registerDate = DateTime.Now.ToString();
                                    user.status = "Active";
                                    db.Users.Add(user);
                                    db.SaveChanges();
                                    TempData["msg"] = "<script>alert('Đăng ký thành công');</script>";
                                    return RedirectToAction("Index", "Products");
                                }
                                else
                                {
                                    ViewBag.ErrorMessege = "<script>alert('Nhấp quá ngày rồi má ưi, nhập lại dùm con');</script>";
                                    return View();
                                }

                            }
                            catch (Exception ex)
                            {
                                ViewBag.ErrorMessege = "<script>alert('" + ex.Message + "');</script>";
                                return View();
                            }
                        }
                        else
                        {
                            ViewBag.ErrorMessege = "<script>alert('Username,Email hoặc sdt đã đc đăng ký');</script>";
                            return View();
                        }
                    }
                }

            }
            else
            {
                foreach (ModelState modelState in ViewData.ModelState.Values)
                {
                    foreach (ModelError error in modelState.Errors)
                    {
                        ViewBag.ErrorMessege = "<script>alert('" + error.ErrorMessage.ToString() + user.phone + "');</script>";
                    }
                }
                return View();
            }

        }
        [Authorize]
        public ActionResult ViewProfile()
        {
            var username = Session["username"].ToString();
            using (Entities1 db = new Entities1())
            {
                return View(db.Users.Where(x => x.username.Equals(username)).FirstOrDefault());
            }
        }
        [Authorize]
        public ActionResult EditProfile(int id)
        {
            var username = Session["username"].ToString();
            using (Entities1 db = new Entities1())
            {
                return View(db.Users.Where(x => x.username.Equals(username)).FirstOrDefault());
            }
        }
        [Authorize]
        [HttpPost]
        public ActionResult EditProfile(int id, User user)
        {
            var username = Session["username"].ToString();
            using (Entities1 db = new Entities1())
            {
                List<User> listUser = db.Users.ToList();
                bool flag = true;
                foreach (User us in listUser)
                {
                    if (us.username.Equals(username) == false)
                    {
                        if (us.email != null && us.phone != null && us.username != null)
                        {
                            if (user.email.ToLower().Equals(us.email.ToLower()) || user.phone.ToLower().Equals(us.phone.ToLower()) || user.email.ToLower().Equals(us.phone.ToLower()) || user.phone.ToLower().Equals(us.email.ToLower()) || user.username.ToLower().Equals(us.email.ToLower()) || user.username.ToLower().Equals(us.phone.ToLower()))
                            {
                                flag = false;
                            }
                        }
                    }
                }
                if (flag == true)
                {
                    string currentDate = DateTime.Now.ToString("yyyy-MM-dd");
                    DateTime current = DateTime.ParseExact(currentDate, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                    DateTime birth = DateTime.ParseExact(user.birthday, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                    if (birth < current)
                    {
                        user.email = user.email.ToLower();
                        user.username = user.username.ToLower();
                        var local = db.Set<User>().Local.FirstOrDefault(f => f.userID == id);
                        if (local != null)
                        {
                            db.Entry(local).State = EntityState.Detached;
                        }
                        db.Entry(user).State = EntityState.Modified;
                        db.SaveChanges();
                        TempData["msg"] = "<script>alert('Cập nhật thông tin người dùng thành công');</script>";
                        return RedirectToAction("ViewProfile");
                    }
                    else
                    {
                        ViewBag.ErrorMessege = "<script>alert('Nhấp quá ngày rồi má ưi, nhập lại dùm con');</script>";
                        return View();
                    }
                }
                else
                {
                    ViewBag.ErrorMessege = "<script>alert('Email hoặc sdt đã được đăng ký');</script>";
                    return View(db.Users.Where(x => x.username.Equals(username)).FirstOrDefault());
                }

            }
        }

        public ActionResult ResetPassword()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ResetPassword(EmailModel model)
        {
            string senderEmail = System.Configuration.ConfigurationManager.AppSettings["SenderEmail"].ToString();
            string senderPass = System.Configuration.ConfigurationManager.AppSettings["SenderPassword"].ToString();
            using (Entities1 db = new Entities1())
            {
                if (db.Users.Where(x => x.username.Equals(model.Username)).FirstOrDefault() != null)
                {
                    if (db.Users.Where(x => x.username.Equals(model.Username)).FirstOrDefault().email.Equals(model.Email))
                    {
                        using (MailMessage mm = new MailMessage(senderEmail, model.Email))
                        {
                            mm.Subject = "Reset password";
                            Random rnd = new Random();

                            string pass = "";
                            for (int x = 0; x < 6; x += 1)
                            {
                                char randomChar = (char)rnd.Next('a', 'z');
                                pass += randomChar;
                            }
                            User us = db.Users.Where(x => x.username.Equals(model.Username)).FirstOrDefault();
                            us.password = pass;
                            var local = db.Set<User>()
                            .Local
                            .FirstOrDefault(f => f.username.Equals(model.Username));
                            if (local != null)
                            {
                                db.Entry(local).State = EntityState.Detached;
                            }
                            db.Entry(us).State = EntityState.Modified;
                            db.SaveChanges();
                            mm.Body = "Anh ơi em reset lại password cho anh nè:  " + pass;
                            mm.IsBodyHtml = false;
                            using (SmtpClient smtp = new SmtpClient())
                            {
                                smtp.Host = "smtp.gmail.com";
                                smtp.EnableSsl = true;
                                NetworkCredential NetworkCred = new NetworkCredential(senderEmail, senderPass);
                                smtp.UseDefaultCredentials = true;
                                smtp.Credentials = NetworkCred;
                                smtp.Port = 587;
                                smtp.Send(mm);
                                ViewBag.Message = "Email sent.";
                            }
                        }

                        return View();
                    }
                    else
                    {
                        ViewBag.ErrorMessege = "<script>alert('Email đăng ký không trùng khớp');</script>";
                        return View();
                    }
                }
                else
                {
                    ViewBag.ErrorMessege = "<script>alert('Không có user');</script>";
                    return View();
                }

            }

        }
        [Authorize]
        public ActionResult ChangePassword()
        {
            return View();
        }
        [HttpPost]
        [Authorize]
        public ActionResult ChangePassword(User user)
        {
            try
            {
                if (Session["username"] != null)
                {
                    using (Entities1 db = new Entities1())
                    {
                        var username = Session["username"].ToString();
                        var opass = Request["oldpass"].ToString();
                        var npass = Request["newpass"].ToString();
                        var cnpass = Request["confirmnewpass"].ToString();
                        user = db.Users.Where(x => x.username.Equals(username)).FirstOrDefault();
                        if (user.password.Equals(opass))
                        {
                            if (npass.Equals(cnpass))
                            {
                                user.password = npass;
                                var local = db.Set<User>()
                        .Local
                        .FirstOrDefault(f => f.username.Equals(username));
                                if (local != null)
                                {
                                    db.Entry(local).State = EntityState.Detached;
                                }
                                db.Entry(user).State = EntityState.Modified;
                                db.SaveChanges();
                                return RedirectToAction("ViewProfile");
                            }
                            else
                            {
                                ViewBag.ErrorMessege = "<script>alert('Confirm không trùng với password mới');</script>";
                                return View();
                            }
                        }
                        else
                        {
                            ViewBag.ErrorMessege = "<script>alert('Password cũ sai');</script>";
                            return View();
                        }

                    }
                }
                else
                {
                    return RedirectToAction("LoginA", "Login");
                }
            }
            catch
            {
                ViewBag.ErrorMessege = "<script>alert('Exception');</script>";
                return View();
            }
        }

    }
}
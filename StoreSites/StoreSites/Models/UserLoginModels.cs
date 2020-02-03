using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace StoreSites.Models
{
    public class UserLoginModels
    {
        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "UserName")]
        public string username { get; set; }
        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string password { get; set; }
        public UserLoginModels(string users, string pass)
        {
            username = users;
            password = pass;
        }
        public UserLoginModels()
        {

        }
    }
}
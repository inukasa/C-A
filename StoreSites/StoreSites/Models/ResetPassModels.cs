using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace StoreSites.Models
{
    public class ResetPassModels
    {
        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "UserName")]
        public string username { get; set; }
        [Required]
        [DataType(DataType.EmailAddress)]
        [Display(Name = "Email")]
        public string email { get; set; }
        public ResetPassModels(string users, string em)
        {
            username = users;
            email = em;
        }
        public ResetPassModels()
        {

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StoreSites.Models
{
    public class ColorModels
    {
        public string color { get; set; }
        public List<string> sizes { get; set; }
        public int Inven { get; set; }
        public ColorModels()
        {
            sizes = new List<string>();
        }
    }
}
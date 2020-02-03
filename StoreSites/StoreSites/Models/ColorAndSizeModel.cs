using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StoreSites.Models
{
    public class ColorAndSizeModel
    {
        public List<ColorModels> listColorASize { get; set; }
        public ColorAndSizeModel()
        {
            listColorASize = new List<ColorModels>();
        }
    }
}
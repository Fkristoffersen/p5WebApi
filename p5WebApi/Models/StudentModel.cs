using System.ComponentModel.DataAnnotations;

namespace p5WebApi.Models
{
    public class StudentModel
    {
        [Key]
        public int idStudent { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string Postal { get; set; }
        public string Phone { get; set; }
    }
}

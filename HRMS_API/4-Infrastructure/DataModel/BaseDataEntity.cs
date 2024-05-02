
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace Phonix.Infrastructure.DataModel
{
    public class BaseDataEntity
    {
        //public int StatusId { get; set; }

        //[ForeignKey("StatusId")]
        //public virtual StatusInformation StatusInformation { get; set; }     
        public int CreatedBy { get; set; }

        [Column(TypeName = "datetime")]
        public DateTime CreatedDate { get; set; }

        public int? ModifiedBy { get; set; }

        [Column(TypeName = "datetime")]
        public DateTime? ModifiedDate { get; set; }
    }
}

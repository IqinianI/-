﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class travel_comt_reply
    {
        public int trreply_id { get; set; }
        public int trcomt_id { get; set; }
        public int reply_aim { get; set; }
        public int user_id { get; set; }
        public DateTime reply_time { get; set; }
        public string reply_cont { get; set; }
        public int like_count { get; set; }
    }
}

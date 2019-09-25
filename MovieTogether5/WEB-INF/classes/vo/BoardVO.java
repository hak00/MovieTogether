package vo;

import java.sql.Timestamp;

public class BoardVO {

		private int num;
		private String name;
		private String pass;
		private String subject;
		private String content;
		private int re_ref;
		private int re_lev;
		private int re_seq;
		private int readcount;
		private Timestamp date;
		private String ip;
		private String file;
		
		
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getPass() {
			return pass;
		}
		public void setPass(String pass) {
			this.pass = pass;
		}
		public String getSubject() {
			return subject;
		}
		public void setSubject(String subject) {
			this.subject = subject;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public int getRe_ref() {
			return re_ref;
		}
		public void setRe_ref(int re_ref) {
			this.re_ref = re_ref;
		}
		public int getRe_lev() {
			return re_lev;
		}
		public void setRe_lev(int re_lev) {
			this.re_lev = re_lev;
		}
		public int getRe_seq() {
			return re_seq;
		}
		public void setRe_seq(int re_seq) {
			this.re_seq = re_seq;
		}
		public int getReadcount() {
			return readcount;
		}
		public void setReadcount(int readcount) {
			this.readcount = readcount;
		}
		public Timestamp getDate() {
			return date;
		}
		public void setDate(Timestamp date) {
			this.date = date;
		}
		public String getIp() {
			return ip;
		}
		public void setIp(String ip) {
			this.ip = ip;
		}
		public String getFile() {
			return file;
		}
		public void setFile(String file) {
			this.file = file;
		}
		
}

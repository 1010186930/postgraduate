using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO.Ports;
using System.Text.RegularExpressions;

namespace WindowsFormsComTest
{
    public partial class Form1 : Form
    {
        SerialPort s = new SerialPort();
        StringBuilder builder = new StringBuilder();
        long received_count = 0;
        long send_count = 0;

        //long send_count = 0;
        private void Form1_Load(object sender, EventArgs e)
        {

        }
        public Form1()
        {
            InitializeComponent();
            button_com.Text = "打开串口";
            Control.CheckForIllegalCrossThreadCalls = false;  //防止跨线程出错
            int[] item = { 600,1200,2400,4800,9600,14400,19200,28800,38400,57600, 115200,128000,256000 };
            foreach (int a in item) //foreach适合未知循环个数时
            {
                comboBox_baud_select.Items.Add(a.ToString());
            }
            comboBox_baud_select.SelectedItem = comboBox_baud_select.Items[4];
        }

        private void Button_com_Click(object sender, EventArgs e)
        {
            try
            {           
            if (!s.IsOpen )
            {
                    button_send.Enabled = true;
                    s.PortName = comboBox_com_selsct.SelectedItem.ToString();
                    s.BaudRate = Convert.ToInt32(comboBox_baud_select.SelectedItem.ToString());   //     获取或设置串行波特率。
                    s.Open();
                    s.DataReceived += s_DataReceived;
                
                    
                    button_com.Text = "关闭串口";
                }
            else
            {
                button_com.Text = "打开串口";
                    s.Close();
            }
            }
            catch (Exception  ee)
            {
                MessageBox.Show(ee.ToString());
            }
        }
        void s_DataReceived(object sender,SerialDataReceivedEventArgs e)  //数据接收事件，读到数据的长度赋值给count，
            //如果是8位，就申请一个byte类型的buff数组，s句柄来读数据
        {
            int count = s.BytesToRead;  //     接收缓冲区中数据的字节数。
            //String str = null;
            
            byte[] buff = new byte[count];            
            received_count += count;
            s.Read(buff, 0, count);
            builder.Clear();
            this .Invoke ((EventHandler )(delegate
            {   
                if(radioButton_gettext.Checked == true )
                {
                    //Regex regChina = new Regex("^[^\x00-\xFF]");
                    //if(regChina.IsMatch(buff))
                    builder.Append(Encoding.GetEncoding("GB18030").GetString(buff));  //中文GBK编码
                   
                }
               
                if (radioButton_getHex .Checked == true)
                {
                    foreach (byte b in buff )
                    {
                        builder.Append(b.ToString("X2") + " ");
                    }
                }
                
                this.textBox_get.AppendText(builder.ToString());
                label_getcount.Text = "Get:" + received_count.ToString();
            }));
        }

        private void ComboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void Button_scanf_Click(object sender, EventArgs e)
        {
            int i;
            //添加端口名导comboBox1
            string[] ports = SerialPort.GetPortNames();
            
            if (ports.Length ==0  ) MessageBox.Show("未找到端口");
            else
            {
                if (comboBox_com_scanf.Items.Count != 0)
                {
                    for(i = 0;i< comboBox_com_scanf.Items.Count;i++)
                    {
                        comboBox_com_scanf.Items.Remove(comboBox_com_scanf.Items[i]);
                    }
                    ;
                }
                    
                comboBox_com_scanf.Items.AddRange(ports);              
                comboBox_com_scanf.SelectedItem = comboBox_com_scanf.Items[0];
                comboBox_com_selsct.SelectedItem = comboBox_com_scanf.Items[0];
            }


            
            
            
                
            
        }

        private void ComboBox_bote_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void Button_res_received_Click(object sender, EventArgs e)
        {
            textBox_get.Text = "";
        }

        private void ComboBox_com_scanf_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void 清零_Click(object sender, EventArgs e)
        {
            
        }

        private void Button_res_getcount_Click(object sender, EventArgs e)
        {
            received_count = 0;
            send_count = 0;
            label_getcount.Text = "Get:" + received_count.ToString();
            label_sendcount.Text = "Send:" + send_count.ToString();
        }

        private void RadioButton_getHex_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void RadioButton_gettext_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void Button_res_send_Click(object sender, EventArgs e)
        {
            textBox_send.Text = "";
        }

        private void Button_send_Click(object sender, EventArgs e)
        {
            int n=0;
            if (radioButton_sendHex .Checked ==true )
            {

                // MatchCollection mc = Regex.Matches(textBox_send.Text, @"(?!)[/da-f]{2}");
                String[] mc = textBox_send.Text.Split(' ');      //分离为数组
                
                List<byte> buff = new List<byte>();
                //foreach (Match m in mc)
                //{
                //    buff.Add(byte.Parse(m.Value));
                    
                //}
                foreach (string m in mc)
                {
                    try
                    {
                        buff.Add(byte.Parse(m, System.Globalization.NumberStyles.HexNumber));
                    }catch(Exception ee)
                    {
                        MessageBox.Show(ee.ToString());
                    }
                    
                }

                if(checkBox_newLine.Checked == true)
                {
                    buff.Add(0x0d);
                    buff.Add(0x0a);
                }
                

                s.Write(buff.ToArray(), 0, buff.Count);
                n = buff.Count;
                
            }
            
            if (radioButton_sendtext.Checked == true)
            {
                byte[] sent_bytes;
                if (checkBox_newLine.Checked == false)
                {
                    sent_bytes = Encoding.GetEncoding("GB18030").GetBytes(textBox_send.Text);
                    n = textBox_send.TextLength;
                }
                    
                else
                {
                    sent_bytes = Encoding.GetEncoding("GB18030").GetBytes(textBox_send.Text + "\r\n");
                    n = textBox_send.TextLength + 2;
                }
                    
                
                s.Write(sent_bytes,0,sent_bytes.Length);
                //s.Write(sent_bytes, 0, sent_bytes.Length);
                
            }
            
            send_count += n;
            label_sendcount.Text = "Send:" + send_count.ToString();
        }

        private void TextBox_get_TextChanged(object sender, EventArgs e)
        {

        }
    }
}

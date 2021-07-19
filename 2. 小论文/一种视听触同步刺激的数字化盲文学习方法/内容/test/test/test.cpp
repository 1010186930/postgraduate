#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include <malloc.h>

#include "test.h"
int getPower(int x, int y);//递归计算阶乘
void deleteExtraceSpace(char* str1, char* str2);//删除多余空格
void average(float* p, int n);//计算二维数组元素的平均数
void search(float(*p)[2], int n);//显示二维数组的某一行的全部元素
void Int_To_Str(int x, char* Str);//整数转成字符串
void selectSort(char(*pt)[50], int n);//字符串由小到大排序
void inverse(int* p, int n);
char* StrtoBraille(int num);
void align_120to37(void);
void ASCIItoBraille(char* toTranslate, char* translated);
void findX();
void UART3Write(char* data);
void StrReplace(char* strSrc, char* strFind, char* strReplace); 
void StrReplaceB(char* strSrc, char* strFind, char* strReplace);
void HZtoBinary(char* HZ, char* Binary, int len);
char* ReplaceSubStr(const char* str, const char* srcSubStr, const char* dstSubStr, char* out);
void NoBlankSpace(char* pStr);
void DeleteRightSpace(char* pStr);
void DeleteLeftSpace(char* pStr);
void bookmarkRename(char str[10][100], int nums);
void bookmarkRename2(char str[100], int nums);
void selectSort_descending(char(*pt)[100], int n);
void findExt(char* file_name, char* name, char* ext);
void selectSort_ascending(char(*pt)[100], int n);
void DX_FCBraille(char tbtmp[20][7]);//分好组的盲文点序传入
void reverse(char s[]);
unsigned char binary(char* str_bin);
int main()
{
	char str[10][100] = { 
		{"书签10 二法萨芬三法师法师法师法师法师法师法师法.c"},
		{"书签9 我.txt"}, 
		{"书签8 我的祖国uu.txt"}, 
		{"书签7 我的.txt"}, 
		{"书签6 我的u祖国.txt"}, 
		{"书签5 我的祖国a.txt"}, 
		{"书签4 我的祖国b.txt"}, 
		{"书签3 我的祖国c.txt"}, 
		{"书签2 我的祖国d.txt"}, 
		/*{"书签1 我的祖国问问我我我.txt"}*/
	};
	char str2[20][7] = {
		{"123456"},
		{"000002"},
		{"000003"},
		{"000004"},
		{"000005"},
		{"000006"},
		{"000007"},
		{"000008"},
		{"000009"},
		{"000010"},
		{"000011"},
		{"000012"},
		{"000013"},
		{"000014"},
		{"000015"},
		{"000016"},
		{"000017"},
		{"000018"},
		{"000019"},
		{"000020"}
	};
	/*DX_FCBraille(str2);
	for (int i = 0; i < 20; i++)
	{
		
		printf("%s\n", str2[i]);
	}
	reverse(str2[0]);*/
	unsigned char  table_bin[8] = { 1,2,4,8,16,32,64,128 };
	unsigned short int b = 0;
	unsigned char a = 16;
	b = a;
	printf("%d", b);
	
	/*char st2r[] = "123456";
	char* p = st2r;
	*(p + 2) = '\0';
	printf("%s", st2r);*/
	//for (int i = 0; i < 10; i++)
	//{
	//	printf("%s\n", str[i]);
	//}
	/*printf("排序前\n");
	for (int i = 0; i < 10; i++)
	{
		printf("%s\n", str[i]);
	}
	selectSort_ascending(str, 9);
	bookmarkRename(str, 9);
	printf("排序后\n");
	for (int i = 0; i < 10; i++)
	{
		printf("%s\n", str[i]);
	}*/
	//char str1[50] = "ab";
	//char str2[50] = "abcdef";
	//strcpy(str1, str2);
	//
	//printf("%s", str1);
	//char str3[] = "123456789";
	//char str2[] = "888";
	//memcpy(str3, str2, strlen(str2));//短字符串str2覆盖长字符str3的内存，结果是888456789
	//printf("%s", str3);
	//char str2[10][50] = { {"书签1我的祖国"},{"书签2我的祖国"}, {"书签3我的祖国"}, {"书签4我的祖国"}, {"书签5我的祖国"}, {"书签6我的祖国"},
	//{"书签7我的祖国"}, {"书签8我的祖国"}, {"书签9我的祖国"}, {"书签10我的祖国"} };
	//char str3[3][50] = { {"书签1我的祖国"}, {"书签2我的祖国"} ,{"书签10我的祖国"} };
	//char str4[3][50] = { {"书签1 我的祖国"}, {"书签2 我的祖国"} ,{"书签10 我的祖国"} };
	//selectSort(str, 10);
	//for (int i = 0; i < 10; i++)
	//	printf("%s\n", str[i]);
	//printf("\n\n");
	//selectSort(str2, 10);
	//for (int i = 0; i < 10; i++)
	//	printf("%s\n", str2[i]);
	//printf("\n\n");
	//selectSort(str3, 3);
	//for (int i = 0; i < 3; i++)
	//	printf("%s\n", str3[i]);
	//printf("\n\n");
	//selectSort(str4, 3);
	//for (int i = 0; i < 3; i++)
	//	printf("%s\n", str4[i]);

}
int getPower(int x, int y)
{
	if (y < 0)
		return 0;
	else if (y == 0)
		return 1;
	else
		return x * getPower(x, y - 1);
}
void deleteExtraceSpace(char* str1, char* str2)
{
	char* p = str1;
	char* q = str2;
	while (*p)
	{
		if (*p != ' ')
			*q++ = *p++;
		else
		{
			*q++=' ';
			while (*p == ' ')
				p++;
		}
	}
	*q = '\0';
}
void average(float* p, int n)
{
	float* p_end = p + n;
	float sum = 0, aver;
	for (; p <p_end; p++)
		sum = sum + (*p);
	aver = sum / n;
	printf("%f\n", aver);
}
void search(float(*p)[2], int n)
{
	int i = 0;
	for (; i < 2; i++)
		printf("%f,", p[n][i]);
}
void Int_To_Str(int x, char* Str)//整数转成字符串
{
	int t;
	char* Ptr, Buf[5];
	int i = 0;
	Ptr = Str;
	if (x < 10)  // 当整数小于10，转换为0x格式 
	{
		*Ptr++ = x + 0x30;
	}
	else
	{
		while (x > 0)
		{
			t = x % 10;
			x = x / 10;
			Buf[i++] = t + 0x30; // 通过计算把数字编成ASCII码形式  
		}
		i--;
		for (; i >= 0; i--)   // 将得到的字符串倒序  
		{
			*(Ptr++) = Buf[i];
		}
	}
	*Ptr = '\0';
}
void selectSort_descending(char(*pt)[50], int n)  //形参pt为指向二维字符数组的指针
{
	int i, j, k;
	char tmp[50];  //临时字符数组
	for (i = 0; i < n - 1; i++)  //遍历所有未排序的字符串的趟数
	{
		k = i;  //变量k存放当前最小字符串的下标
		for (j = i + 1; j < n; j++)               //遍历下标从(i+1)~(n-1)的所有字符串
			if (strcmp(pt[k], pt[j]) > 0)  //字符串进行两两大小比较,如果>0,则执行if语句体
				k = j;                     //将当前最小的字符串的数组下标赋值给变量k
		if (k != i)                       //如果k不等于i,则执行if语句体
		{   //两个字符串进行交换操作
			strcpy(tmp, pt[k]);
			strcpy(pt[k], pt[i]);
			strcpy(pt[i], tmp);
		}
	}
	if (n == 10)
	{
		strcpy(tmp, pt[0]);
		strcpy(pt[0], pt[1]);
		strcpy(pt[1], tmp);
		for (i = 0; i < n - 1; i++)
		{
			strcpy(tmp, pt[i]);
			strcpy(pt[i], pt[i + 1]);
			strcpy(pt[i + 1], tmp);
		}
	}
}
void inverse(int *p,int n)
{
	int* q = p + n-1;
	int temp = 0;
	while (p < q)
	{
		temp = *p;
		*p = *q;
		*q = temp;
		p++;
		q--;
	}
}
char* StrtoBraille(int num)
{
	
	char a[2][3] = { {"12"},{"24"} };
	return a[num];
	
}
void align_120to37(void)
{
	FILE* ft1 = NULL;
	FILE* ft2 = NULL;
	FILE* fd1 = NULL;
	FILE* fd2 = NULL;
	fopen_s(&ft1, "C:\\Users\\Administrator\\Desktop\\分词结果.txt", "r");//分词结果用ft1表示
	fopen_s(&ft2, "C:\\Users\\Administrator\\Desktop\\text.txt", "w");//点显机读的text用ft2表示
	fopen_s(&fd1, "C:\\Users\\Administrator\\Desktop\\盲文块.txt", "r+");//盲文块用fd1表示
	fopen_s(&fd2, "C:\\Users\\Administrator\\Desktop\\data.txt", "w");//点显机读的data用fd2表示

	/*ft1=fopen("C:\\Users\\Administrator\\Desktop\\分词结果.txt","r");//分词结果用ft1表示
	ft2=fopen("C:\\Users\\Administrator\\Desktop\\text.txt","w");//点显机读的text用ft2表示
	fd1=fopen("C:\\Users\\Administrator\\Desktop\\盲文块.txt","r+");//盲文块用fd1表示
	fd2=fopen("C:\\Users\\Administrator\\Desktop\\data.txt","w");//点显机读的data用fd2表示*/
	char bufferd[127];//实际上最多只读存126，最后一位是'\0'
	char buffert[38];//实际上最多只能存37，最后一位是'\0'
	char bd[7];
	char br0[7];
	char br1[7];
	char br2[7];
	char kong[7] = "000000";
	int l, n, i, j, k, s = 0;
	// int yan=0;
	int j1 = 0, t = 0, j2 = 0, j3 = 0;
	int m1 = 0, m2 = 0, m = 0;
	while (1)
	{
		fseek(ft1, t, SEEK_SET);//从ft1的t位置开始读
		fseek(fd1, s, SEEK_SET);//从fd1的s位置开始读
		fgets(bufferd, 127, fd1);//从fd1读 126个字符存到bufferd
		fgets(buffert, 38, ft1);//从ft1读37个字符到buffert
		for (i = 0; i < strlen(bufferd); i++)//计算字符串 butterd 的长度，直到空结束字符，但不包括空结束字符，strlen最大为126，即计算数组的有效长度
			bufferd[i] = bufferd[i];//就是赋值，没什么含义
		bufferd[i] = '\0';//最大情况下127置结束标志符
		for (l = 0; l < strlen(buffert); l++)//计算字符串 buttert 的长度，直到空结束字符，但不包括空结束字符
			buffert[i] = buffert[i];
		buffert[l] = '\0';//这三行似乎没有用到
		if (i < 126)//小于126只可能是小于等于120，末尾直接输出
		{
			fputs(bufferd, fd2);//把bufferd字符串写入fd2中，但不包括空字符  
			fputs(buffert, ft2);//把buffert字符串写入ft2中，但不包括空字符
			break;
		}
		else//大于120即126，构成了20方和21方
		{
			for (k = 0; k < 6; k++)//拿出第20方到br1
				br1[k] = bufferd[6 * 19 + k];
			br1[6] = '\0';
			for (k = 0; k < 6; k++)//拿出第21方到br2
				br2[k] = bufferd[6 * 20 + k];
			br2[6] = '\0';
			if ((br1[0] != '0' || br1[1] != '0' || br1[2] != '0' || br1[3] != '0' || br1[4] != '0' || br1[5] != '0') && (br2[0] != '0' || br2[1] != '0' || br2[2] != '0' || br2[3] != '0' || br2[4] != '0' || br2[5] != '0'))//br1、br2都不为空方
			{
				//计算多少个空格
				for (j = 18, j1 = 0; j >= 0; j--)//遍历盲文块的前19格
				{
					for (n = 0; n < 6; n++)
						br0[n] = bufferd[6 * j + n];
					br0[6] = '\0';//每6个存入字符数组br0，最后一位添置结束符
					if (br0[0] == '0' && br0[1] == '0' && br0[2] == '0' && br0[3] == '0' && br0[4] == '0' && br0[5] == '0')//如果6个点都是0，则代表空方
						j1 = j1 + 1;//前19格盲文块有j1个空方
				}
				printf("第20和21方都不是空方，前19方的空方数%d\n", j1);//第一次printf输出前19格的空方数

				//处理分词结果文本
				for (j = 0, j2 = 0; j < 37; j++)//循环37次
				{
					if (buffert[j] == ' ')//如果buffert[j]是空格
						j2++;//j2计数
					fputc(buffert[j], ft2);//把buffert[j]写入ft2
					if (j2 == j1) break;//当分词结果的前37个字符的空格数等于前19格盲文块的空格数时，跳出循环
				}
				for (j3 = 0; j3 < 36 - j; j3++)//计算要补多少个空格ft2才能满37个字符
					fputc(' ', ft2);//补空格
				t = t + j + 1;//偏移量为上次读到位置的后面一位，由于上面的for循环是调用的全局变量j，所以值可以传下去！这点和在for循环里面int j不同！

				for (j = 18; j >=0; j--)//遍历盲文块的前18格，2-19个
				{
					for (n = 0; n < 6; n++)
						br0[n] = bufferd[6 * j + n];
					br0[6] = '\0';
					if (br0[0] == '0' && br0[1] == '0' && br0[2] == '0' && br0[3] == '0' && br0[4] == '0' && br0[5] == '0')//倒着判断，如果遇到空方
						break;//跳出该循环
				}
				for (k = 0; k <= j; k++)
					for (n = 0; n < 6; n++)
						fputc(bufferd[6 * k + n], fd2);//把包括空方的前j个方写入fd2
				for (k = 0; k < 19 - j; k++)
					for (n = 0; n < 6; n++)
						fputc('0', fd2);//补满120个点
				s = s + 6 * j + 6;//记录位置

			}
			else
			{
				for (k = 0; k < 120; k++)
					fputc(bufferd[k], fd2);//先读取前120个点到fd2

				for (k = 0; k < 6; k++)
					bd[k] = bufferd[114 + k];
				bd[6] = '\0';//把第20方放进bd[6]

				for (j = 19, j1 = 0; j >= 0; j--)//取前20方
				{
					for (n = 0; n < 6; n++)
						br0[n] = bufferd[6 * j + n];
					br0[6] = '\0';
					if (br0[0] == '0' && br0[1] == '0' && br0[2] == '0' && br0[3] == '0' && br0[4] == '0' && br0[5] == '0')
						j1 = j1 + 1;//判断前20方有几个空格
				}
				if (bd[0] == '0' && bd[1] == '0' && bd[2] == '0' && bd[3] == '0' && bd[4] == '0' && bd[5] == '0')//如果第20方是空格
				{
					for (j = 0, j2 = 0; j < 37; j++)//判断前37个字符有多少个空格
					{
						if (buffert[j] == ' ')
							j2++;
						fputc(buffert[j], ft2);
						if (j2 == j1)
							break;//两者空格数一样后跳出该循环
					}
					printf("第20是空方，前20方的空方数%d\n", j1);
				}
				else//如果第20方不是空格，分词结果的空格就要多数一格，不然会漏掉最后的一个字
				{
					for (j = 0, j2 = 0; j < 37; j++)
					{
						if (buffert[j] == ' ')
							j2++;
						if (j2 == j1 + 1)
						{
							j = j - 1;
							break;
						}
						fputc(buffert[j], ft2);
					}
					printf("第20不是空方，前20方的空方数%d\n", j1);
				}
				for (j3 = 0; j3 < 36 - j; j3++)//补满37个
					fputc(' ', ft2);
				t = t + j + 1;//更新偏移量
				s = s + 120;//更新偏移量
			}
		}

	}
	fseek(fd2, 0, SEEK_END);
	fseek(ft2, 0, SEEK_END);
	m1 = ftell(fd2);
	m2 = ftell(ft2);
	if (m1 % 120 == 0)
	{
		m = m2 % 37;
		for (j = 0; j < 37 - m; j++)
			fputc(' ', ft2);
	}
	fclose(fd1);
	fclose(fd2);
	fclose(ft1);
	fclose(ft2);	
}
void ASCIItoBraille(char* toTranslate, char* translated)
{
	char temp[7] = "";
	
	while (*toTranslate != NULL)
	{
		strcpy(temp, "123");
		printf("temp:%s\r\n", temp);
		strcat(translated, temp);
		printf("buffer2:%s\r\n", translated);
		toTranslate++;
	}
}
void findX()
{
	int a[] = { 1,3,8,10,50,52,57,89 };
	int x;
	int left = 0;
	int right = sizeof(a) / sizeof(int);
	int mid = (left + right) / 2;
	int j = 0;
	printf("输入数字:\n");
	scanf("%d", &x);
	for (j = 0; j < 8; j++)
	{
		if (a[j] == x)
		break;
	}
	if (j < 8)
	{
		while (x != a[mid])
		{
			if (a[mid] > x)
			{
				right = mid;
				printf("右边的序号是%d\n", right);
			}
			if (a[mid] < x)
			{
				left = mid;
				printf("左边的序号是%d\n", left);
			}
			mid = (left + right) / 2;
			printf("中间的值是%d\n", a[mid]);
		}
		printf("找到了x是%d", a[mid]);
	}
	else
		printf("没有这个数字");
}
void UART3Write(char* data)
{
	int i, len;
	len = strlen((char*)data);
	printf("%d,%d", len,sizeof(data[0]));
}
void StrReplace(char* strSrc, char* strFind, char* strReplace)
{
	while (*strSrc != '\0')
	{
		if (*strSrc == *strFind)
		{
			if (strncmp(strSrc, strFind, strlen(strFind)) == 0)
			{
				int i = strlen(strFind);
				int j = strlen(strReplace); 
				printf("i= %d,j = %d\n", i, j); 
				char* q = strSrc + i;
				printf("*q= %s\n", q); 
				while ((*strSrc++ = *strReplace++) != '\0'); 
				printf("strSrc- 1 = %s\n", strSrc - 1); 
				printf("*q= %s\n", q); 
				while ((*strSrc++ = *q++) != '\0');
			}
			else 
				strSrc++;
		}
		else  
			strSrc++; 
	}
}
void StrReplaceB(char* strSrc, char* strFind, char* strReplace) 
{
	while (*strSrc != '\0') 
	{
		if (*strSrc == *strFind) 
		{
			if (strncmp(strSrc, strFind, strlen(strFind)) == 0) 
			{
				int i = strlen(strFind); 
				int j = strlen(strReplace); 
				char* q = strSrc + i; 
				char* p = q;//p、q均指向剩余字符串的首地址 
				char* repl = strReplace; 
				int lastLen = 0;
				while (*q++ != '\0') 
					lastLen++; 
				char* temp = new char[lastLen+1];//临时开辟一段内存保存剩下的字符串,防止内存覆盖 
				for (int k = 0; k < lastLen; k++) 
				{ 
					*(temp+k) = *(p+k); 
				} 
				*(temp+lastLen) = '\0'; 
				while (*repl != '\0') 
				{ 
					*strSrc++ = *repl++; 
				} 
				p = strSrc; 
				char* pTemp = temp;//回收动态开辟内存 
				while (*pTemp != '\0') 
				{ 
					*p++ = *pTemp++; 
				} 
				delete temp;
				*p = '\0'; 
			} 
			else strSrc++; 
		} 
		else strSrc++; 
	} 
} 
void HZtoBinary(char* HZ, char*Binary,int len)
{
	char* p = HZ;
	int pos;
	memset(Binary, 9, 6);
	while (*p != NULL)
	{
		pos = atoi(p);
		*(Binary+pos-1) = '1';
		p++;
	}
}

char* ReplaceSubStr(const char* str, const char* srcSubStr, const char* dstSubStr, char* out)
{
	if (!str && !out)
	{
		return NULL;
	}
	if (!srcSubStr && !dstSubStr)
	{
		return out;
	}
	char* out_temp = out;
	int src_len = strlen(srcSubStr);//子串长度
	int dst_len = strlen(dstSubStr);//替换串长度
	while (*str != '\0')//str是原字符串
	{
		if (*str == *srcSubStr)//srcSubStr是要查找的子串
		{
			//可能发生替换
			const char* str_temp = str;
			int flag = 0;
			for (int i = 0; i < src_len; i++)
			{
				if (str_temp[i] != srcSubStr[i])
				{
					flag = 1;
					break;
				}
			}
			if (flag)
			{
				//说明不用替换
				*out_temp++ = *str++;
			}
			else
			{
				//说明要替换
				for (int i = 0; i < dst_len; i++)
				{
					*out_temp++ = dstSubStr[i];
				}
				str = str + src_len;
			}
		}
		else
		{
			//不用替换
			*out_temp++ = *str++;
		}
	}
	*out_temp =0;
	return out;
}
void NoBlankSpace(char* pStr)
{
	char* pTmp = pStr;
	while (*pStr != '\0')
	{
		if (*pStr != ' ')
		{
			*pTmp = *pStr;
			pTmp++;
		}
		++pStr;
	}
	*pTmp = '\0';
}
void DeleteRightSpace(char* pStr)
{
	char* pTmp = pStr + strlen(pStr)-1;
	while (*pTmp == ' ')
	{
		*pTmp-- = '\0';
	}
}
void DeleteLeftSpace(char* pStr)
{
	char* pTmp = pStr;
	while (*pTmp == ' ')
		pTmp++;
	while (*pTmp != '\0')
	{
		*pStr=*pTmp;
		pStr++;
		pTmp++;
	}
	*pTmp = '\0';
}
void bookmarkRename(char str[10][100],int nums)
{
	char(*p)[100] = str;
	char temp[3] = "";
	char str1[100] = "";
	char str2[100] = "";
	const char str3[] = "书签";
	char* q = NULL;
	int i=0,j=-1;
	for (i = 0; i < nums; i++)
	{
		memset(str2, '\0', sizeof(str2) / sizeof(str2[0]));
		q = strchr(*(p+i), ' ');
		strcpy(str2,q);//书签名称
		memcpy(temp, *(p + i) + 4, 2);
		NoBlankSpace(temp);
		j = atoi(temp);
		sprintf(temp, "%d", j-1);
		memset(str1, '\0', sizeof(str1) / sizeof(str1[0]));
		strcat(str1, str3);
		strcat(str1, temp);
		strcat(str1, str2);
		memcpy(*(p + i), str1, strlen(str1));
		*(*(p + i) + strlen(str1)) = '\0';
	}
}
void selectSort_descending(char(*pt)[100], int n)
/*对书签1~10排序，书签名格式：书签X XXXXX,形参pt为指向二维字符数组的指针。书签1 XXX比书签10 XXX小，因为空格的ASCII码是20,0的ASCII码是30.
但汉字的ASCII比数字和符号的ASCII大。如果有书签10 XXX，最终结果为书签1 XXX,书签10 XXX，书签2 XXX.....*/
{
	int i, j, k;
	char tmp[100];  //临时字符数组
	for (i = 0; i < n - 1; i++)  //遍历所有未排序的字符串的趟数
	{
		k = i;  //变量k存放当前最小字符串的下标
		for (j = i + 1; j < n; j++)               //遍历下标从(i+1)~(n-1)的所有字符串
			if (strcmp(pt[k], pt[j]) < 0)  //字符串进行两两大小比较,如果>0,则执行if语句体
				k = j;                     //将当前最小的字符串的数组下标赋值给变量k
		if (k != i)                       //如果k不等于i,则执行if语句体
		{   //两个字符串进行交换操作
			strcpy(tmp, pt[k]);
			strcpy(pt[k], pt[i]);
			strcpy(pt[i], tmp);
		}
	}
	if (n == 9)//如果书签数目是10个，就进行如下交换：先交换10和1的顺序，然后依次交换1后面相邻的两个序号，把10交换到最后一位
	{
		/*strcpy(tmp, pt[0]);
		strcpy(pt[0], pt[1]);
		strcpy(pt[1], tmp);*/
		for (i = 9; i > 1; i--)
		{
			strcpy(tmp, pt[i-2]);
			strcpy(pt[i-2], pt[i - 1]);
			strcpy(pt[i - 1], tmp);
		}
	}
}
void selectSort_ascending(char(*pt)[100], int n)
/*对书签1~10排序，书签名格式：书签X XXXXX,形参pt为指向二维字符数组的指针。书签1 XXX比书签10 XXX小，因为空格的ASCII码是20,0的ASCII码是30.
但汉字的ASCII比数字和符号的ASCII大。如果有书签10 XXX，最终结果为书签1 XXX,书签10 XXX，书签2 XXX.....*/
{
	int i, j, k;
	char tmp[100];  //临时字符数组
	char num[3]="";
	char* p = NULL;
	int(*temp)[1] = (int(*)[1])malloc(sizeof(int) * n);
	//for (i = 0; i < n; i++)
	//{
	//	p = pt[i];
	//	/*p = strchr(pt[i], ' ');*/
	//	memcpy(num, p + 4, 2);
	//	NoBlankSpace(num);
	//	j = atoi(num);
	//	*temp[i] = j;
	//	/*printf("j是%d\n", j);*/
	//}
	for (i = 0; i < n - 1; i++)  //遍历所有未排序的字符串的趟数
	{
		for (int z = 0; z < n; z++)
		{
			p = pt[z];
			/*p = strchr(pt[i], ' ');*/
			memcpy(num, p + 4, 2);
			NoBlankSpace(num);
			j = atoi(num);
			*temp[z] = j;
			/*printf("j是%d\n", j);*/
		}
		/*for (i = 0; i < n; i++)
			printf("%d\n", *temp[i]);*/
		k = i;  //变量k存放当前最小字符串的下标
		for (j = i + 1; j < n; j++)               //遍历下标从(i+1)~(n-1)的所有字符串
			if (*temp[k] > * temp[j])  //字符串进行两两大小比较,如果>0,则执行if语句体
				k = j;                     //将当前最小的字符串的数组下标赋值给变量k
		if (k != i)                       //如果k不等于i,则执行if语句体
		{   //两个字符串进行交换操作
			strcpy(tmp, pt[k]);
			strcpy(pt[k], pt[i]);
			strcpy(pt[i], tmp);
		}
	/*	for (int i = 0; i < 10; i++)
		{
			printf("%s\n", pt[i]);

		}
		printf("-------------\n");*/
		
	}
	
	free(temp);
	p = NULL;
	//if (n == 9)//如果书签数目是10个，就进行如下交换：先交换10和1的顺序，然后依次交换1后面相邻的两个序号，把10交换到最后一位
	//{
	//	/*strcpy(tmp, pt[0]);
	//	strcpy(pt[0], pt[1]);
	//	strcpy(pt[1], tmp);*/
	//	for (i = 0; i < 8; i++)
	//	{
	//		strcpy(tmp, pt[i]);
	//		strcpy(pt[i], pt[i + 1]);
	//		strcpy(pt[i+1], tmp);
	//	}
	//}

}
void findExt(char* file_name, char* name, char* ext)
{
	char* end;
	char* ptr = file_name;
	while (*ptr != '\0')
	{
		ptr++;//移到文件名末尾
	}
	end = ptr;//存一下
	while (*ptr != '.')
	{
		ptr--;//从后往前移动到.的位置
	}
	memcpy(name, file_name, (ptr - file_name) * sizeof(char));
	memcpy(ext, ptr + 1, (end - ptr) * sizeof(char));
}
void bookmarkRename2(char *str, int nums)
{
	char* p = str;
	char temp[3] = "";
	char str1[100] = "";
	char str2[100] = "";
	const char str3[] = "书签";
	char* q = NULL;
	int i = 0, j = -1;
	memset(str2, '\0', sizeof(str2) / sizeof(str2[0]));
	q = strchr(p, ' ');
	strcpy(str2, q);//书签名称
	memcpy(temp,p + 4, 2);
	NoBlankSpace(temp);
	j = atoi(temp);
	sprintf(temp, "%d", j - 1);
	memset(str1, '\0', sizeof(str1) / sizeof(str1[0]));
	strcat(str1, str3);
	strcat(str1, temp);
	strcat(str1, str2);
	memcpy(p, str1, strlen(str1));
	*(p+ strlen(str1)) = '\0';
	
}
void DX_FCBraille(char tbtmp[20][7])//分好组的盲文点序传入
{
	int count_s, i = 0;
	int dx[15];
	char gdtmp[9];
	int i1, i2, m, n, x, k;
	for (i1 = 0; i1 < 10; i1++)//1~20方的倒叙->20~1方
	{
		for (i2 = 0; i2 < 6; i2++)
		{
			x = tbtmp[i1][i2];
			tbtmp[i1][i2] = tbtmp[19 - i1][i2];
			tbtmp[19 - i1][i2] = x;
		}
	}
	/*for (count_s = 0; count_s < 20; count_s += 4)
	{
		for (k = count_s; k < count_s + 4; k++)
		{
			n = tbtmp[k][2];
			tbtmp[k][2] = tbtmp[k][0];
			tbtmp[k][0] = n;
			m = tbtmp[k][5];
			tbtmp[k][5] = tbtmp[k][3];
			tbtmp[k][3] = m;
		}
		strncpy(gdtmp, tbtmp[count_s], 6);
		strncat(gdtmp, tbtmp[count_s + 1], 2);
		gdtmp[8] = '\0';
		reverse(gdtmp);
		dx[i] = binary(gdtmp);
		memset(gdtmp, '\0', sizeof(gdtmp));
		strncpy(gdtmp, tbtmp[count_s + 1] + 2, 4);
		strncat(gdtmp, tbtmp[count_s + 2], 4);
		gdtmp[8] = '\0';
		reverse(gdtmp);
		dx[i + 1] = binary(gdtmp);
		memset(gdtmp, '\0', sizeof(gdtmp));
		strncpy(gdtmp, tbtmp[count_s + 2] + 4, 2);
		strncat(gdtmp, tbtmp[count_s + 3], 6);
		gdtmp[8] = '\0';
		reverse(gdtmp);
		dx[i + 2] = binary(gdtmp);
		memset(gdtmp, '\0', sizeof(gdtmp));
		i += 3;
	}
	DXdis(dx);*/
}
void reverse(char s[])
{
	int i, j, c, n = 0;
	while (s[n] != '\0')
		n++;
	/*i<j的判断是必须的，若没有，则会又将原本置换的部分又置换回去，实则没变*/
	for (i = 0, j = n - 1; i < j; i++, j--)
	{
		c = s[i];
		s[i] = s[j];
		s[j] = c;
	}
}
unsigned char binary(char* str_bin) {
	unsigned char i, s = 0;
	unsigned char  table_bin[8] = { 1,2,4,8,16,32,64,128 };//2的n次方

	for (i = 8; i >= 1; i--) {
		if (*str_bin == '1') {
			s += table_bin[i - 1];
		}
		str_bin++;
	}

	return(s);
}
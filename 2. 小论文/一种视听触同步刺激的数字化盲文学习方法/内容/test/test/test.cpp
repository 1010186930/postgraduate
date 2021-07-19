#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include <malloc.h>

#include "test.h"
int getPower(int x, int y);//�ݹ����׳�
void deleteExtraceSpace(char* str1, char* str2);//ɾ������ո�
void average(float* p, int n);//�����ά����Ԫ�ص�ƽ����
void search(float(*p)[2], int n);//��ʾ��ά�����ĳһ�е�ȫ��Ԫ��
void Int_To_Str(int x, char* Str);//����ת���ַ���
void selectSort(char(*pt)[50], int n);//�ַ�����С��������
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
void DX_FCBraille(char tbtmp[20][7]);//�ֺ����ä�ĵ�����
void reverse(char s[]);
unsigned char binary(char* str_bin);
int main()
{
	char str[10][100] = { 
		{"��ǩ10 ������������ʦ��ʦ��ʦ��ʦ��ʦ��ʦ��ʦ��.c"},
		{"��ǩ9 ��.txt"}, 
		{"��ǩ8 �ҵ����uu.txt"}, 
		{"��ǩ7 �ҵ�.txt"}, 
		{"��ǩ6 �ҵ�u���.txt"}, 
		{"��ǩ5 �ҵ����a.txt"}, 
		{"��ǩ4 �ҵ����b.txt"}, 
		{"��ǩ3 �ҵ����c.txt"}, 
		{"��ǩ2 �ҵ����d.txt"}, 
		/*{"��ǩ1 �ҵ��������������.txt"}*/
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
	/*printf("����ǰ\n");
	for (int i = 0; i < 10; i++)
	{
		printf("%s\n", str[i]);
	}
	selectSort_ascending(str, 9);
	bookmarkRename(str, 9);
	printf("�����\n");
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
	//memcpy(str3, str2, strlen(str2));//���ַ���str2���ǳ��ַ�str3���ڴ棬�����888456789
	//printf("%s", str3);
	//char str2[10][50] = { {"��ǩ1�ҵ����"},{"��ǩ2�ҵ����"}, {"��ǩ3�ҵ����"}, {"��ǩ4�ҵ����"}, {"��ǩ5�ҵ����"}, {"��ǩ6�ҵ����"},
	//{"��ǩ7�ҵ����"}, {"��ǩ8�ҵ����"}, {"��ǩ9�ҵ����"}, {"��ǩ10�ҵ����"} };
	//char str3[3][50] = { {"��ǩ1�ҵ����"}, {"��ǩ2�ҵ����"} ,{"��ǩ10�ҵ����"} };
	//char str4[3][50] = { {"��ǩ1 �ҵ����"}, {"��ǩ2 �ҵ����"} ,{"��ǩ10 �ҵ����"} };
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
void Int_To_Str(int x, char* Str)//����ת���ַ���
{
	int t;
	char* Ptr, Buf[5];
	int i = 0;
	Ptr = Str;
	if (x < 10)  // ������С��10��ת��Ϊ0x��ʽ 
	{
		*Ptr++ = x + 0x30;
	}
	else
	{
		while (x > 0)
		{
			t = x % 10;
			x = x / 10;
			Buf[i++] = t + 0x30; // ͨ����������ֱ��ASCII����ʽ  
		}
		i--;
		for (; i >= 0; i--)   // ���õ����ַ�������  
		{
			*(Ptr++) = Buf[i];
		}
	}
	*Ptr = '\0';
}
void selectSort_descending(char(*pt)[50], int n)  //�β�ptΪָ���ά�ַ������ָ��
{
	int i, j, k;
	char tmp[50];  //��ʱ�ַ�����
	for (i = 0; i < n - 1; i++)  //��������δ������ַ���������
	{
		k = i;  //����k��ŵ�ǰ��С�ַ������±�
		for (j = i + 1; j < n; j++)               //�����±��(i+1)~(n-1)�������ַ���
			if (strcmp(pt[k], pt[j]) > 0)  //�ַ�������������С�Ƚ�,���>0,��ִ��if�����
				k = j;                     //����ǰ��С���ַ����������±긳ֵ������k
		if (k != i)                       //���k������i,��ִ��if�����
		{   //�����ַ������н�������
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
	fopen_s(&ft1, "C:\\Users\\Administrator\\Desktop\\�ִʽ��.txt", "r");//�ִʽ����ft1��ʾ
	fopen_s(&ft2, "C:\\Users\\Administrator\\Desktop\\text.txt", "w");//���Ի�����text��ft2��ʾ
	fopen_s(&fd1, "C:\\Users\\Administrator\\Desktop\\ä�Ŀ�.txt", "r+");//ä�Ŀ���fd1��ʾ
	fopen_s(&fd2, "C:\\Users\\Administrator\\Desktop\\data.txt", "w");//���Ի�����data��fd2��ʾ

	/*ft1=fopen("C:\\Users\\Administrator\\Desktop\\�ִʽ��.txt","r");//�ִʽ����ft1��ʾ
	ft2=fopen("C:\\Users\\Administrator\\Desktop\\text.txt","w");//���Ի�����text��ft2��ʾ
	fd1=fopen("C:\\Users\\Administrator\\Desktop\\ä�Ŀ�.txt","r+");//ä�Ŀ���fd1��ʾ
	fd2=fopen("C:\\Users\\Administrator\\Desktop\\data.txt","w");//���Ի�����data��fd2��ʾ*/
	char bufferd[127];//ʵ�������ֻ����126�����һλ��'\0'
	char buffert[38];//ʵ�������ֻ�ܴ�37�����һλ��'\0'
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
		fseek(ft1, t, SEEK_SET);//��ft1��tλ�ÿ�ʼ��
		fseek(fd1, s, SEEK_SET);//��fd1��sλ�ÿ�ʼ��
		fgets(bufferd, 127, fd1);//��fd1�� 126���ַ��浽bufferd
		fgets(buffert, 38, ft1);//��ft1��37���ַ���buffert
		for (i = 0; i < strlen(bufferd); i++)//�����ַ��� butterd �ĳ��ȣ�ֱ���ս����ַ������������ս����ַ���strlen���Ϊ126���������������Ч����
			bufferd[i] = bufferd[i];//���Ǹ�ֵ��ûʲô����
		bufferd[i] = '\0';//��������127�ý�����־��
		for (l = 0; l < strlen(buffert); l++)//�����ַ��� buttert �ĳ��ȣ�ֱ���ս����ַ������������ս����ַ�
			buffert[i] = buffert[i];
		buffert[l] = '\0';//�������ƺ�û���õ�
		if (i < 126)//С��126ֻ������С�ڵ���120��ĩβֱ�����
		{
			fputs(bufferd, fd2);//��bufferd�ַ���д��fd2�У������������ַ�  
			fputs(buffert, ft2);//��buffert�ַ���д��ft2�У������������ַ�
			break;
		}
		else//����120��126��������20����21��
		{
			for (k = 0; k < 6; k++)//�ó���20����br1
				br1[k] = bufferd[6 * 19 + k];
			br1[6] = '\0';
			for (k = 0; k < 6; k++)//�ó���21����br2
				br2[k] = bufferd[6 * 20 + k];
			br2[6] = '\0';
			if ((br1[0] != '0' || br1[1] != '0' || br1[2] != '0' || br1[3] != '0' || br1[4] != '0' || br1[5] != '0') && (br2[0] != '0' || br2[1] != '0' || br2[2] != '0' || br2[3] != '0' || br2[4] != '0' || br2[5] != '0'))//br1��br2����Ϊ�շ�
			{
				//������ٸ��ո�
				for (j = 18, j1 = 0; j >= 0; j--)//����ä�Ŀ��ǰ19��
				{
					for (n = 0; n < 6; n++)
						br0[n] = bufferd[6 * j + n];
					br0[6] = '\0';//ÿ6�������ַ�����br0�����һλ���ý�����
					if (br0[0] == '0' && br0[1] == '0' && br0[2] == '0' && br0[3] == '0' && br0[4] == '0' && br0[5] == '0')//���6���㶼��0�������շ�
						j1 = j1 + 1;//ǰ19��ä�Ŀ���j1���շ�
				}
				printf("��20��21�������ǿշ���ǰ19���Ŀշ���%d\n", j1);//��һ��printf���ǰ19��Ŀշ���

				//����ִʽ���ı�
				for (j = 0, j2 = 0; j < 37; j++)//ѭ��37��
				{
					if (buffert[j] == ' ')//���buffert[j]�ǿո�
						j2++;//j2����
					fputc(buffert[j], ft2);//��buffert[j]д��ft2
					if (j2 == j1) break;//���ִʽ����ǰ37���ַ��Ŀո�������ǰ19��ä�Ŀ�Ŀո���ʱ������ѭ��
				}
				for (j3 = 0; j3 < 36 - j; j3++)//����Ҫ�����ٸ��ո�ft2������37���ַ�
					fputc(' ', ft2);//���ո�
				t = t + j + 1;//ƫ����Ϊ�ϴζ���λ�õĺ���һλ�����������forѭ���ǵ��õ�ȫ�ֱ���j������ֵ���Դ���ȥ��������forѭ������int j��ͬ��

				for (j = 18; j >=0; j--)//����ä�Ŀ��ǰ18��2-19��
				{
					for (n = 0; n < 6; n++)
						br0[n] = bufferd[6 * j + n];
					br0[6] = '\0';
					if (br0[0] == '0' && br0[1] == '0' && br0[2] == '0' && br0[3] == '0' && br0[4] == '0' && br0[5] == '0')//�����жϣ���������շ�
						break;//������ѭ��
				}
				for (k = 0; k <= j; k++)
					for (n = 0; n < 6; n++)
						fputc(bufferd[6 * k + n], fd2);//�Ѱ����շ���ǰj����д��fd2
				for (k = 0; k < 19 - j; k++)
					for (n = 0; n < 6; n++)
						fputc('0', fd2);//����120����
				s = s + 6 * j + 6;//��¼λ��

			}
			else
			{
				for (k = 0; k < 120; k++)
					fputc(bufferd[k], fd2);//�ȶ�ȡǰ120���㵽fd2

				for (k = 0; k < 6; k++)
					bd[k] = bufferd[114 + k];
				bd[6] = '\0';//�ѵ�20���Ž�bd[6]

				for (j = 19, j1 = 0; j >= 0; j--)//ȡǰ20��
				{
					for (n = 0; n < 6; n++)
						br0[n] = bufferd[6 * j + n];
					br0[6] = '\0';
					if (br0[0] == '0' && br0[1] == '0' && br0[2] == '0' && br0[3] == '0' && br0[4] == '0' && br0[5] == '0')
						j1 = j1 + 1;//�ж�ǰ20���м����ո�
				}
				if (bd[0] == '0' && bd[1] == '0' && bd[2] == '0' && bd[3] == '0' && bd[4] == '0' && bd[5] == '0')//�����20���ǿո�
				{
					for (j = 0, j2 = 0; j < 37; j++)//�ж�ǰ37���ַ��ж��ٸ��ո�
					{
						if (buffert[j] == ' ')
							j2++;
						fputc(buffert[j], ft2);
						if (j2 == j1)
							break;//���߿ո���һ����������ѭ��
					}
					printf("��20�ǿշ���ǰ20���Ŀշ���%d\n", j1);
				}
				else//�����20�����ǿո񣬷ִʽ���Ŀո��Ҫ����һ�񣬲�Ȼ��©������һ����
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
					printf("��20���ǿշ���ǰ20���Ŀշ���%d\n", j1);
				}
				for (j3 = 0; j3 < 36 - j; j3++)//����37��
					fputc(' ', ft2);
				t = t + j + 1;//����ƫ����
				s = s + 120;//����ƫ����
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
	printf("��������:\n");
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
				printf("�ұߵ������%d\n", right);
			}
			if (a[mid] < x)
			{
				left = mid;
				printf("��ߵ������%d\n", left);
			}
			mid = (left + right) / 2;
			printf("�м��ֵ��%d\n", a[mid]);
		}
		printf("�ҵ���x��%d", a[mid]);
	}
	else
		printf("û���������");
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
				char* p = q;//p��q��ָ��ʣ���ַ������׵�ַ 
				char* repl = strReplace; 
				int lastLen = 0;
				while (*q++ != '\0') 
					lastLen++; 
				char* temp = new char[lastLen+1];//��ʱ����һ���ڴ汣��ʣ�µ��ַ���,��ֹ�ڴ渲�� 
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
				char* pTemp = temp;//���ն�̬�����ڴ� 
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
	int src_len = strlen(srcSubStr);//�Ӵ�����
	int dst_len = strlen(dstSubStr);//�滻������
	while (*str != '\0')//str��ԭ�ַ���
	{
		if (*str == *srcSubStr)//srcSubStr��Ҫ���ҵ��Ӵ�
		{
			//���ܷ����滻
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
				//˵�������滻
				*out_temp++ = *str++;
			}
			else
			{
				//˵��Ҫ�滻
				for (int i = 0; i < dst_len; i++)
				{
					*out_temp++ = dstSubStr[i];
				}
				str = str + src_len;
			}
		}
		else
		{
			//�����滻
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
	const char str3[] = "��ǩ";
	char* q = NULL;
	int i=0,j=-1;
	for (i = 0; i < nums; i++)
	{
		memset(str2, '\0', sizeof(str2) / sizeof(str2[0]));
		q = strchr(*(p+i), ' ');
		strcpy(str2,q);//��ǩ����
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
/*����ǩ1~10������ǩ����ʽ����ǩX XXXXX,�β�ptΪָ���ά�ַ������ָ�롣��ǩ1 XXX����ǩ10 XXXС����Ϊ�ո��ASCII����20,0��ASCII����30.
�����ֵ�ASCII�����ֺͷ��ŵ�ASCII���������ǩ10 XXX�����ս��Ϊ��ǩ1 XXX,��ǩ10 XXX����ǩ2 XXX.....*/
{
	int i, j, k;
	char tmp[100];  //��ʱ�ַ�����
	for (i = 0; i < n - 1; i++)  //��������δ������ַ���������
	{
		k = i;  //����k��ŵ�ǰ��С�ַ������±�
		for (j = i + 1; j < n; j++)               //�����±��(i+1)~(n-1)�������ַ���
			if (strcmp(pt[k], pt[j]) < 0)  //�ַ�������������С�Ƚ�,���>0,��ִ��if�����
				k = j;                     //����ǰ��С���ַ����������±긳ֵ������k
		if (k != i)                       //���k������i,��ִ��if�����
		{   //�����ַ������н�������
			strcpy(tmp, pt[k]);
			strcpy(pt[k], pt[i]);
			strcpy(pt[i], tmp);
		}
	}
	if (n == 9)//�����ǩ��Ŀ��10�����ͽ������½������Ƚ���10��1��˳��Ȼ�����ν���1�������ڵ�������ţ���10���������һλ
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
/*����ǩ1~10������ǩ����ʽ����ǩX XXXXX,�β�ptΪָ���ά�ַ������ָ�롣��ǩ1 XXX����ǩ10 XXXС����Ϊ�ո��ASCII����20,0��ASCII����30.
�����ֵ�ASCII�����ֺͷ��ŵ�ASCII���������ǩ10 XXX�����ս��Ϊ��ǩ1 XXX,��ǩ10 XXX����ǩ2 XXX.....*/
{
	int i, j, k;
	char tmp[100];  //��ʱ�ַ�����
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
	//	/*printf("j��%d\n", j);*/
	//}
	for (i = 0; i < n - 1; i++)  //��������δ������ַ���������
	{
		for (int z = 0; z < n; z++)
		{
			p = pt[z];
			/*p = strchr(pt[i], ' ');*/
			memcpy(num, p + 4, 2);
			NoBlankSpace(num);
			j = atoi(num);
			*temp[z] = j;
			/*printf("j��%d\n", j);*/
		}
		/*for (i = 0; i < n; i++)
			printf("%d\n", *temp[i]);*/
		k = i;  //����k��ŵ�ǰ��С�ַ������±�
		for (j = i + 1; j < n; j++)               //�����±��(i+1)~(n-1)�������ַ���
			if (*temp[k] > * temp[j])  //�ַ�������������С�Ƚ�,���>0,��ִ��if�����
				k = j;                     //����ǰ��С���ַ����������±긳ֵ������k
		if (k != i)                       //���k������i,��ִ��if�����
		{   //�����ַ������н�������
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
	//if (n == 9)//�����ǩ��Ŀ��10�����ͽ������½������Ƚ���10��1��˳��Ȼ�����ν���1�������ڵ�������ţ���10���������һλ
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
		ptr++;//�Ƶ��ļ���ĩβ
	}
	end = ptr;//��һ��
	while (*ptr != '.')
	{
		ptr--;//�Ӻ���ǰ�ƶ���.��λ��
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
	const char str3[] = "��ǩ";
	char* q = NULL;
	int i = 0, j = -1;
	memset(str2, '\0', sizeof(str2) / sizeof(str2[0]));
	q = strchr(p, ' ');
	strcpy(str2, q);//��ǩ����
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
void DX_FCBraille(char tbtmp[20][7])//�ֺ����ä�ĵ�����
{
	int count_s, i = 0;
	int dx[15];
	char gdtmp[9];
	int i1, i2, m, n, x, k;
	for (i1 = 0; i1 < 10; i1++)//1~20���ĵ���->20~1��
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
	/*i<j���ж��Ǳ���ģ���û�У�����ֽ�ԭ���û��Ĳ������û���ȥ��ʵ��û��*/
	for (i = 0, j = n - 1; i < j; i++, j--)
	{
		c = s[i];
		s[i] = s[j];
		s[j] = c;
	}
}
unsigned char binary(char* str_bin) {
	unsigned char i, s = 0;
	unsigned char  table_bin[8] = { 1,2,4,8,16,32,64,128 };//2��n�η�

	for (i = 8; i >= 1; i--) {
		if (*str_bin == '1') {
			s += table_bin[i - 1];
		}
		str_bin++;
	}

	return(s);
}
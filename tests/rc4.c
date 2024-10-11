#include <stdio.h>
#include <string.h>
 
void KSA(unsigned char*s,unsigned char*key,unsigned long len)
{
 int i=0;
 int j=0;
 unsigned char k[256]={};
 unsigned char temp = 0;
 for(i=0;i<256;i++)
 {
  s[i]=i;         
  k[i]=key[i%len];   
 }
 for(i=0;i<256;i++)
 {
  j=(j+s[i]+k[i])%256;   
  temp=s[i];
  s[i]=s[j];
  s[j]=temp;    
 }
}
 
void PRNG_XOR(unsigned char*s,unsigned char*data,unsigned long len)
{
 int i=0,j=0,t=0;
 unsigned long k=0;
 unsigned char temp;
 for(k=0;k<len;k++)
 {
  i=(i+1)%256;          
  j=(j+s[i])%256;         
  temp=s[i];
  s[i]=s[j];
  s[j]=temp;            
  t=(s[i]+s[j])%256;      

  data[k]^=s[t];          
 }
}
 
int main()
{
 unsigned char s[256]={0};
 char key[256] = "X0nB@D";
 //char data[512] = {228,21,196,237,166,47,86,16,187,19,235,173,117,86,199,187,233,185,204,2,58,80,159,54,144,105,190,125,66,68,202,198,212,36,92,210,185,36,193,24,147,179,234};    //�ҵ����ɣ�С������(max117)��������ȥ256(min125)
 char data[512]={-28,21,-60,-19,-90,47,86,16,-69,19,-21,-83,117,86,-57,-69,-69,-23,-71,-52,2,58,80,-97,54,-112,105,-66,124,66,68,-54,-58,-44,36,92,-46,-71,36,-63,24,-109,-77,-22};
 unsigned long len = strlen(data);
 KSA(s,(unsigned char*)key,len);
 PRNG_XOR(s,(unsigned char*)data,len);
 printf("output:%s",(unsigned char*)data);
 return 0;
}
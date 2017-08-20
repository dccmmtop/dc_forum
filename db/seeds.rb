Topic.delete_all
User.delete_all
User.crate(
name: "dccmmtop",
email: "dccmmtop@gmail.com",
password: "123456"
  )

Topic.create(
  user_id:1,
  title: "My Very First Topic",
  body:
  '### There Is Something You Should Know!

  This is my very first Topic using markdown!

  How do you like it?  I learned this from [RichOnRails.com](http://richonrails.com/articles/rendering-markdown-with-redcarpet)!}

   ```c
   #include<stdio.h>
   int main()
   {
    printf("%s",a);
    return 0;
  }
  ```

  '
  )
Topic.create(
  user_id: 1,
  title: 'Bus System',
  body:'[题目链接](http://acm.hdu.edu.cn/showproblem.php?pid=1690)

  Problem Description

  Because of the huge population of China, public transportation is very important. Bus is an important transportation method in traditional public transportation system. And it’s still playing an important role even now.
  The bus system of City X is quite strange. Unlike other city’s system, the cost of ticket is calculated based on the distance between the two stations. Here is a list which describes the relationship between the distance and the cost.
  ![img](http://acm.hdu.edu.cn/data/images/C116-1002-1.JPG)
  Your neighbor is a person who is a really miser. He asked you to help him to calculate the minimum cost between the two stations he listed. Can you solve this problem for him?
  To simplify this problem, you can assume that all the stations are located on a straight line. We use x-coordinates to describe the stations’ positions.

  Input

  The input consists of several test cases. There is a single number above all, the number of cases. There are no more than 20 cases.
  Each case contains eight integers on the first line, which are L1, L2, L3, L4, C1, C2, C3, C4, each number is non-negative and not larger than 1,000,000,000. You can also assume that L1<=L2<=L3<=L4.
  Two integers, n and m, are given next, representing the number of the stations and questions. Each of the next n lines contains one integer, representing the x-coordinate of the ith station. Each of the next m lines contains two integers, representing the start point and the destination.
  In all of the questions, the start point will be different from the destination.
  For each case,2<=N<=100,0<=M<=500, each x-coordinate is between -1,000,000,000 and 1,000,000,000, and no two x-coordinates will have the same value.

 

  Output

  For each question, if the two stations are attainable, print the minimum cost between them. Otherwise, print “Station X and station Y are not attainable.” Use the format in the sample.

 

  Sample Input

```markdown
2
1 2 3 4 1 3 5 7
4 2
1
2
3
4
1 4
4 1
1 2 3 4 1 3 5 7
4 1
1
2
3
10
1 4
```
Sample Output

```markdown
Case 1:
The minimum cost between station 1 and station 4 is 3.
The minimum cost between station 4 and station 1 is 3.
Case 2:
Station 1 and station 4 are not attainable.
```

### 题意

公交收费的方与距离有关，其中距离与收费的标准如题中标所示。现在给你一些公交车站的位置坐标，和几次询问，根据这些公交车站的位置和题中的收费标准来计算两个车站的最小费用。

### 分析

题中询问的两个公交车站的最小费用，给出的是这两个车站的下标 ，而不是位置，比如题中的第二组测试数据中的1  4  ，问的是第一个车站与第四车站的最小费用是多少，而不是位置为1的车站与位置为4的车站之间的最小费用。这一题最不好想的是如何根据位置来建图。

### 代码

```c
#include<cstdio>
#include<iostream>
#include<queue>
#include<string.h>
#include<math.h>
#include<cstdlib>
#define inf 0x3f3f3f3f3f3f3f3f
using namespace std;
long long int station[150];
int n,m;
int s,e;
long long int road[150][150];
long long int dis[150];
long long int C[5];
long long int L[5];
int vis[150];
long long int dij(int s,int e)
{
    for( int i=1; i<=n; i++)
    {
        dis[i]=road[s][i];
        vis[i]=0;
    }
    dis[s]=0;
    vis[s]=1;
    int cnt=1;
    int flag=s;
    while(cnt<n)
    {
        long long int minx=inf;
        for( int i=1; i<=n; i++)
        {
            if(vis[i]==0&&dis[i]<minx)
            {
                minx=dis[i];
                flag=i;
            }
        }
        vis[flag]=1;
        cnt++;
        for( int i=1; i<=n; i++)
        {
            if(vis[i]==0&&dis[i]>dis[flag]+road[flag][i])
                dis[i]=dis[flag]+road[flag][i];
        }
    }
    return dis[e];
}
void floyd()
{
    for(int k=1; k<=n; k++)
        for(int i=1; i<=n; i++)
            for(int j=1; j<=n; j++)
                road[i][j]=min(road[i][j],road[i][k]+road[k][j]);
}
long long int get(long long int dis)
{
    if(dis>0&&dis<=L[1])
        return C[1];
    if(dis>L[1]&&dis<=L[2])
        return C[2];
    if(dis>L[2]&&dis<=L[3])
        return C[3];
    if(dis>L[3]&&dis<=L[4])
        return C[4];
    else return inf;
}
int main()
{
    freopen("2.txt","r",stdin);
    int t;
    scanf("%d",&t);
    long long int k=1;
    while(t--)
    {
        for(int i=1; i<=4; i++)
            scanf("%lld",&L[i]);
        for(int i=1; i<=4; i++)
            scanf("%lld",&C[i]);
        scanf("%d%d",&n,&m);
        for( int i=1; i<=n; i++)
        {
            scanf("%lld",&station[i]);
        }
        for( int i=1; i<=n; i++)
            for(int j=i+1; j<=n; j++)
            {
                road[i][j]=road[j][i]=get(abs(station[i]-station[j]));
            }
        //   floyd();
        printf("Case %d:\n",k++);
        for( int i=0; i<m; i++)
        {
            scanf("%d%d",&s,&e);//s  e 就是下标，而不是位置
            long long int distance;
            distance=road[s][e];
            distance=dij(s,e);
            if(distance==inf)
            {
                printf("Station %d and station %d are not attainable.\n",s,e);
            }
            else
                printf("The minimum cost between station %d and station %d is %lld.\n",s,e,distance);
        }
    }
    return 0;
}

```


'
)
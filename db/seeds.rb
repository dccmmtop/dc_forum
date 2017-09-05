
# User.create(
# name: "dccmmtop",
# email: "dccmmtop@gmail.com",
# password: "123456"
#   )

# categories=[
# "未分类","数据库技术","网站开发","软件工程","web前段","手机开发","ruby","Linux","java","rails","爬虫","区块链","算法"
# ]
# categories.each do |category_name|
#   Category.create(name: category_name)
# end
# Topic.delete_all
# Topic.create(
#   user_id:1,
#   title: "My Very First Topic",
#   category_id:1,
#   body:
#   '### There Is Something You Should Know!

#   This is my very first Topic using markdown!

#   How do you like it?  I learned this from [RichOnRails.com](http://richonrails.com/articles/rendering-markdown-with-redcarpet)!}

#    ```c
#    #include<stdio.h>
#    int main()
#    {
#     printf("%s",a);
#     return 0;
#   }
#   ```

#   '
#   )
# Topic.create(
#   user_id: 1,
#   title: 'Bus System',
#   category_id:1,
#   body:'[题目链接](http://acm.hdu.edu.cn/showproblem.php?pid=1690)

#   Problem Description

#   Because of the huge population of China, public transportation is very important. Bus is an important transportation method in traditional public transportation system. And it’s still playing an important role even now.
#   The bus system of City X is quite strange. Unlike other city’s system, the cost of ticket is calculated based on the distance between the two stations. Here is a list which describes the relationship between the distance and the cost.
#   ![img](http://acm.hdu.edu.cn/data/images/C116-1002-1.JPG)
#   Your neighbor is a person who is a really miser. He asked you to help him to calculate the minimum cost between the two stations he listed. Can you solve this problem for him?
#   To simplify this problem, you can assume that all the stations are located on a straight line. We use x-coordinates to describe the stations’ positions.

#   Input

#   The input consists of several test cases. There is a single number above all, the number of cases. There are no more than 20 cases.
#   Each case contains eight integers on the first line, which are L1, L2, L3, L4, C1, C2, C3, C4, each number is non-negative and not larger than 1,000,000,000. You can also assume that L1<=L2<=L3<=L4.
#   Two integers, n and m, are given next, representing the number of the stations and questions. Each of the next n lines contains one integer, representing the x-coordinate of the ith station. Each of the next m lines contains two integers, representing the start point and the destination.
#   In all of the questions, the start point will be different from the destination.
#   For each case,2<=N<=100,0<=M<=500, each x-coordinate is between -1,000,000,000 and 1,000,000,000, and no two x-coordinates will have the same value.

 

#   Output

#   For each question, if the two stations are attainable, print the minimum cost between them. Otherwise, print “Station X and station Y are not attainable.” Use the format in the sample.

 

#   Sample Input

# ```markdown
# 2
# 1 2 3 4 1 3 5 7
# 4 2
# 1
# 2
# 3
# 4
# 1 4
# 4 1
# 1 2 3 4 1 3 5 7
# 4 1
# 1
# 2
# 3
# 10
# 1 4
# ```
# Sample Output

# ```markdown
# Case 1:
# The minimum cost between station 1 and station 4 is 3.
# The minimum cost between station 4 and station 1 is 3.
# Case 2:
# Station 1 and station 4 are not attainable.
# ```

# ### 题意

# 公交收费的方与距离有关，其中距离与收费的标准如题中标所示。现在给你一些公交车站的位置坐标，和几次询问，根据这些公交车站的位置和题中的收费标准来计算两个车站的最小费用。

# ### 分析

# 题中询问的两个公交车站的最小费用，给出的是这两个车站的下标 ，而不是位置，比如题中的第二组测试数据中的1  4  ，问的是第一个车站与第四车站的最小费用是多少，而不是位置为1的车站与位置为4的车站之间的最小费用。这一题最不好想的是如何根据位置来建图。

# ### 代码

# ```c
# #include<cstdio>
# #include<iostream>
# #include<queue>
# #include<string.h>
# #include<math.h>
# #include<cstdlib>
# #define inf 0x3f3f3f3f3f3f3f3f
# using namespace std;
# long long int station[150];
# int n,m;
# int s,e;
# long long int road[150][150];
# long long int dis[150];
# long long int C[5];
# long long int L[5];
# int vis[150];
# long long int dij(int s,int e)
# {
#     for( int i=1; i<=n; i++)
#     {
#         dis[i]=road[s][i];
#         vis[i]=0;
#     }
#     dis[s]=0;
#     vis[s]=1;
#     int cnt=1;
#     int flag=s;
#     while(cnt<n)
#     {
#         long long int minx=inf;
#         for( int i=1; i<=n; i++)
#         {
#             if(vis[i]==0&&dis[i]<minx)
#             {
#                 minx=dis[i];
#                 flag=i;
#             }
#         }
#         vis[flag]=1;
#         cnt++;
#         for( int i=1; i<=n; i++)
#         {
#             if(vis[i]==0&&dis[i]>dis[flag]+road[flag][i])
#                 dis[i]=dis[flag]+road[flag][i];
#         }
#     }
#     return dis[e];
# }
# void floyd()
# {
#     for(int k=1; k<=n; k++)
#         for(int i=1; i<=n; i++)
#             for(int j=1; j<=n; j++)
#                 road[i][j]=min(road[i][j],road[i][k]+road[k][j]);
# }
# long long int get(long long int dis)
# {
#     if(dis>0&&dis<=L[1])
#         return C[1];
#     if(dis>L[1]&&dis<=L[2])
#         return C[2];
#     if(dis>L[2]&&dis<=L[3])
#         return C[3];
#     if(dis>L[3]&&dis<=L[4])
#         return C[4];
#     else return inf;
# }
# int main()
# {
#     freopen("2.txt","r",stdin);
#     int t;
#     scanf("%d",&t);
#     long long int k=1;
#     while(t--)
#     {
#         for(int i=1; i<=4; i++)
#             scanf("%lld",&L[i]);
#         for(int i=1; i<=4; i++)
#             scanf("%lld",&C[i]);
#         scanf("%d%d",&n,&m);
#         for( int i=1; i<=n; i++)
#         {
#             scanf("%lld",&station[i]);
#         }
#         for( int i=1; i<=n; i++)
#             for(int j=i+1; j<=n; j++)
#             {
#                 road[i][j]=road[j][i]=get(abs(station[i]-station[j]));
#             }
#         //   floyd();
#         printf("Case %d:\n",k++);
#         for( int i=0; i<m; i++)
#         {
#             scanf("%d%d",&s,&e);//s  e 就是下标，而不是位置
#             long long int distance;
#             distance=road[s][e];
#             distance=dij(s,e);
#             if(distance==inf)
#             {
#                 printf("Station %d and station %d are not attainable.\n",s,e);
#             }
#             else
#                 printf("The minimum cost between station %d and station %d is %lld.\n",s,e,distance);
#         }
#     }
#     return 0;
# }

# ```


# '
# )
# Topic.create(
# user_id: 1,
# title: "ruby多重排序",
# category_id:1,
# body: '
# ruby中数组进行多层排序非常简单，例子如下：

# 用sort_by
# ```ruby
# def order_weight_sort_by(string)
#   string.split(" ").sort_by do |a|
#       sum_a = a.split("").inject(0) { |mem, var| mem += var.to_i }
#       first_number = a[0].to_i
#       [a.size, sum_a, first_number]
#   end.join(" ")
# end
# ```
# string = "56 65 74 100 99 68 86 980 90" 
# p order_weight_sort_by(string )
# 结果是"90 56 65 74 68 86 99 100 980"

# 上面的方法是先将字符串变成一个由数字字符串组成的数组。然后先按照字符串的长度进行排序，再按照字符串各数字之和进行排序，最后按照字符串的第一个数字大小进行排序。

# 关键代码[a.size, sum_a, first_number]

# 当最后是一个条件数组时，sort_by会按照该条件数组的顺序依次排序。

# 用sort
# ```ruby
# def order_weight_sort(string)
#   string.split(" ").sort do |a, b|
#       sum_a = a.split("").inject(0) { |mem, var| mem += var.to_i }
#       first_number_a = a[0].to_i
#       size_a = a.size

#       sum_b = b.split("").inject(0) { |mem, var| mem += var.to_i }
#       first_number_b = b[0].to_i
#       size_b = b.size

#       [size_a, sum_a, first_number_a] <=> [size_b, sum_b, first_number_b]
#   end.join(" ")
# end
# ```
# string = "56 65 74 100 99 68 86 980 90" 
# p order_weight_sort(string )
# 结果与上面是一样的。

# 关键代码[size_a, sum_a, first_number_a] <=> [size_b, sum_b, first_number_b]

# 这样看起来sort_by比sort简洁很多。
# 确实sort_by只需要一个参数，而sort需要两个参数。但他们实现多层排序是一样的，最后都是用一个条件数组来表示。

# 区别

# 但sort要比sort_by灵活。因为最后的排序条件还可以这样写：

# `[size_b, sum_a, first_number_b] <=> [size_a, sum_b, first_number_a]`
# 这样就相当于先按长度倒序排列，然后再按照字符串各数字之和进行排序，最后再按照首个字符的大小倒序排列。

# 作者：kamionayuki
# 链接：http://www.jianshu.com/p/319d0174f246
# 來源：简书
# 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
# ' )   

Topic.create(
user_id: 1,
title: "ruby多重排序",
category_id:1,
body: %q(
### rails 路由

有时候我需要写一个页面能向show edit 那样可以接受参数的路由,弄了好久不知道怎样解决,今天恍然大悟

我们执行 `rake routes` 就会看到如下

```ruby
                     wechat_nodes GET      /wechat/nodes(.:format)                                  wechat/nodes#index
                                  POST     /wechat/nodes(.:format)                                  wechat/nodes#create
                  new_wechat_node GET      /wechat/nodes/new(.:format)                              wechat/nodes#new
                 edit_wechat_node GET      /wechat/nodes/:id/edit(.:format)                         wechat/nodes#edit
                      wechat_node GET      /wechat/nodes/:id(.:format)                              wechat/nodes#show
                                  PATCH    /wechat/nodes/:id(.:format)                              wechat/nodes#update
                                  PUT      /wechat/nodes/:id(.:format)                              wechat/nodes#update
                                  DELETE   /wechat/nodes/:id(.:format)                              wechat/nodes#destroy

```

这是使用resources 生成一些路由,我们可以模仿写出自己的路由

我们看最后一列的内容,  对于show 来说 他的格式为`/wechat/nodes/:id` 再看edit 他的格式是`/wechat/nodes/:id/edit` 

加入我们要想写一个/wechat/node/edit/34/topic/23 类似的路由,我们可以直接这样写

```ruby
resources nodes do 
  collection do 
    get 'edit/:id/topic/:node_id', to: 'nodes#topic'  as: 'topic_edit'
  end
end
```

这里为什么会有一个`as`呢,因为没有`as`和其后面的名称的话,这样是没有前面的路由信息的.

### 筛选路由-路由冲突的解决方案

Rails项目有一个Article模型,对应ArticlesController控制器,其路由设置如下:

```ruby
resources :articles do
end
```

这样它的CRUD路径就都自动创建出来了 ;

现在我想再添加一个对Article模型搜索的页面,那么首先要在控制器中添加对应的search方法:

```ruby
def search   
  render text:"hello search!!!"
end
```

然后在Article默认路由集合后面添加一行新路由:

`get "articles/search",to:"articles#search"`1

现在我们访问一下articles/search页面,咦?怎么出错了:

![这里写图片描述](http://img.blog.csdn.net/20170310112802687?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbXlkbw==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

仔细看出错信息,原来Article之前的show路由恰恰可以匹配新的search路由,只不过原来的:id变成了search这个字符串哦.这就是为什么报Couldn’t find Article with id=search的原因了!

下面给出解决,我们只需要先禁用默认的show路由:

```ruby
resources :articles,except:[:show] do    
  resources :comments
end
```

然后再生成一条筛选路由即可,所谓筛选路由就是对该路由内容进行细粒度匹配的方法:

```ruby
get "articles/:id",to:"articles#show",constraints:{id:/\d+/}
```

路由都是从上之下依次匹配的,如果上面一条被匹配则路由匹配结束!这里只匹配id为数字的articles/xxx路径,所以search就会默认被忽略从而被后面search正确的路由所匹配!

)
)        

#import "@preview/showybox:2.0.4": showybox
#import "@preview/js:0.1.3": *
#import "@preview/intextual:0.1.1": flushr, intertext-rule
#show: intertext-rule
#import "template.typ": *
#show: report.with()
#show "、": "，" // 読点をカンマに置き換える
#show "。": "．" // 句点をピリオドに置き換える
#show math.cases: it => {
  math.mat(gap: 1em, delim: (it.delim.at(0), none), ..it.children.map(x => (math.display(x), )), align: left)
}


#maketitle(
  title: "Karatzas Shreve Chapter 1.3, 3.1 - 3.7",
  authors: "Leo",
)


== Problem 2.19 の補足

Proposition 2.18 の仮定（$X$ が発展的可測である等）の下で、有界な $cal(B)([0, infinity)) times cal(B)(RR^d)$ 可測関数 $f(t, x)$ に対し、プロセス
$ Y_t = integral_0^t f(s, X_s) dif s, quad t >= 0 $
が次の性質を持つことを示す。
1. $Y$ は ${cal(F)_t}$ に関して発展的可測である。
2. $Y_T$ は $cal(F)_T$-可測な確率変数である（$T$ は停止時刻）。

=== フビニの定理の一般化

ここでいうフビニの定理の一般化（または可測性に関する主張）は、以下のプロセスを保証するらしいです。

#quote(block: true)[
  $g(s, omega)$ が $[0, t] times Omega$ 上の積 $sigma$-加法族に関して可測であるとき、その「部分的な積分」
  $ F(s, omega) = integral_0^s g(u, omega) dif u $
  を考えると、写像 $(s, omega) |-> F(s, omega)$ は $[0, t] times Omega$ 上で可測（発展的可測）になる。
]

通常、各 $t$ 固定で $Y_t$ が $cal(F)_t$ 可測であることを示すには通常のフビニで十分ですが、「プロセスとして $Y$ が発展的可測である」（すなわち $(s, omega)$ の二変数関数として可測である）ことを示すには、この積空間上での可測性保持の議論が必要になります。


== 2.21 Problem (の一致性に関する証明)

$cal(F)_(T+)$ の定義を $cal(F)_(T+) = { A in cal(F) : A inter {T lt.eq t} in cal(F)_(t+), forall t gt.eq 0 }$ とするとき、これが $cal(G) = { A in cal(F) : A inter {T lt t} in cal(F)_t, forall t gt.eq 0 }$ と一致することを示す。

=== Proof

1. $cal(F)_(T+) subset cal(G)$ の証明：
$A in cal(F)_(T+)$ とすると、任意の $s gt.eq 0$ に対して $A inter {T lt.eq s} in cal(F)_(s+)$ である。
任意の $t > 0$ に対して、次のように書き下せる：
$ A inter {T lt t} = A inter ( union.big_(n=1)^infinity {T lt.eq t - 1/n} ) = union.big_(n=1)^infinity (A inter {T lt.eq t - 1/n}) $
仮定より、各 $n$ について $A inter {T lt.eq t - 1/n} in cal(F)_((t - 1/n)+)$ である。
右連続なフィルトレーションの定義 $cal(F)_(s+) = inter.big_(epsilon > 0) cal(F)_(s+epsilon)$ より、十分小さな $epsilon$ を取れば $t - 1/n + epsilon < t$ とできるため、
$ cal(F)_((t - 1/n)+) subset cal(F)_t $
が成り立つ。したがって、可算和 $A inter {T lt t}$ も $cal(F)_t$ に属する（$t=0$ のときは空集合で自明）。
ゆえに $A in cal(G)$ である。

2. $cal(G) subset cal(F)_(T+)$ の証明：
$A in cal(G)$ とすると、任意の $t gt.eq 0$ に対して $A inter {T lt t} in cal(F)_t$ である。
ここで、任意の $t gt.eq 0$ に対して次が成り立つ：
$ A inter {T lt.eq t} = inter.big_(n=1)^infinity (A inter {T lt t + 1/n}) $
仮定より、各 $n$ について $A inter {T lt t + 1/n} in cal(F)_(t + 1/n)$ である。
任意の $epsilon > 0$ に対して、$1/n < epsilon$ となる $n$ を取れば $cal(F)_(t + 1/n) subset cal(F)_(t + epsilon)$ なので、
$ A inter {T lt.eq t} in cal(F)_(t + epsilon) $
これがすべての $epsilon > 0$ について成り立つため、
$ A inter {T lt.eq t} in inter.big_(epsilon > 0) cal(F)_(t + epsilon) = cal(F)_(t+) $
したがって $A in cal(F)_(T+)$ である。

以上より、$cal(F)_(T+) = cal(G)$ が示された。

= 1.3 Continuous-Time Martingale



== 3.1 Definition

The process ${X_t, cal(F)_t; 0 <= t < infinity}$ is said to be a submartingale (respectively, a supermartingale) if, for every $0 <= s < t < infinity$, we have, a.s. $P$:
$ E[X_t|cal(F)_s] >= X_s quad " (respectively, " E[X_t|cal(F)_s] <= X_s ")" $
We shall say that ${X_t, cal(F)_t; 0 <= t < infinity}$ is a martingale if it is both a submartingale and a supermartingale.

== 3.2 Problem

Let $T_1, T_2, dots$ be a sequence of independent, exponentially distributed random variables with parameter $lambda > 0$:
$ P[T_i in dif t] = lambda e^(-lambda t) dif t, quad t >= 0. $
Let $S_0 = 0$ and $S_n = sum_(i=1)^n T_i; n >= 1$. Define a continuous-time, integer-valued RCLL process
$ N_t = max {n >= 0; S_n <= t}; quad 0 <= t < infinity. $

(i) Show that for $0 <= s < t$ we have
$ P[S_(N_s + 1) > t | cal(F)_s^N] = e^(-lambda(t-s)), quad "a.s. " P. $

(ii) Show that for $0 <= s < t$, $N_t - N_s$ is a Poisson random variable with parameter $lambda(t - s)$, independent of $cal(F)_s^N$.



== Proof of (i)

=== 1.
まず、集合 $tilde(A) in cal(F)_s^N$ に対して $tilde(A) inter {N_s = n} = A inter {N_s = n}$ となる $A in sigma(T_1, dots, T_n)$ が存在することを示す。

- $cal(G) := { tilde(A) inter {N_s = n} : tilde(A) in cal(F)_s^N }$
- $cal(H) := { A inter {N_s = n} : A in sigma(T_1, dots, T_n) }$

$cal(G)$ の生成族は ${N_(t_1) <= n_1, dots, N_(t_k) <= n_k, N_s = n}$ ($t_k <= s$) である。
ここで、$N_t <= m$ という事象は $S_(m+1) > t$ と同値であり、さらに ${N_s = n}$ という条件下では、$n$ 回目までの到着時刻 $S_1, dots, S_n$ さえわかれば、時刻 $s$ までの $N_t$ の挙動はすべて記述できる。
また、$S_k = T_1 + dots + T_k$ であるから、これらは $sigma(T_1, dots, T_n)$ に含まれる。
逆も同様に成り立つため、$cal(G) = cal(H)$ である。
したがって、任意の $tilde(A) in cal(F)_s^N$ に対して、特定の $A in sigma(T_1, dots, T_n)$ を用いて $tilde(A) inter {N_s = n} = A inter {N_s = n}$ と書ける。

=== 2.

この $A$ を用いて、定義に基づき条件付き期待値を計算する。$T_(n+1)$ の密度関数 $lambda e^(-lambda u)$ を用いる。

$ integral_(tilde(A) inter {N_s = n}) P[S_(n+1) > t | cal(F)_s^N] dif P &= P[{S_(n+1) > t} inter A inter {N_s = n}] \
&= P[{S_n + T_(n+1) > t} inter A inter {S_n <= s < S_n + T_(n+1)}] $

ここで $A$ と $S_n$ は $sigma(T_1, dots, T_n)$ に属するため、$T_(n+1)$ と独立である。$T_(n+1)$ の値を $u$ としておくと：

$ = integral_0^infinity P[{S_n + u > t} inter A inter {S_n <= s < S_n + u}] lambda e^(-lambda u) dif u $

事象の条件を $u$ について整理すると、$u > t - S_n$ かつ $u > s - S_n$ である。$t > s$ なので、$u > t - S_n$ が支配的となる：

$ 
= integral_0^infinity P[{u gt t - S_n}inter A inter {S_n lt.eq s}] lambda e^(- lambda u ) dif u
\
= integral_(t-S_n)^infinity P[{S_n <= s} inter A] lambda e^(-lambda u) dif u \
= E[ 1_(A inter {S_n <= s}) dot integral_(t-S_n)^infinity lambda e^(-lambda u) dif u ] $

積分：
$ integral_(t-S_n)^infinity lambda e^(-lambda u) dif u = [-e^(-lambda u)]_(t-S_n)^infinity = e^(-lambda(t - S_n)) = e^(-lambda(t-s)) dot e^(-lambda(s - S_n)) $

これを代入すると：
$ = e^(-lambda(t-s)) dot E[ 1_(A inter {S_n <= s}) dot e^(-lambda(s - S_n)) ] $

ここで、$e^(-lambda(s - S_n))$ は $integral_(s-S_n)^infinity lambda e^(-lambda v) dif v$ である。
$ = e^(-lambda(t-s)) dot E[ 1_(A inter {S_n <= s}) dot P[T_(n+1) > s - S_n | S_n] ] \
= e^(-lambda(t-s)) dot P[A inter {S_n <= s} inter {T_(n+1) > s - S_n}] \
= e^(-lambda(t-s)) dot P[tilde(A) inter {N_s = n}] $

=== 3. 

全ての $n >= 0$ について和をとることで、
$ integral_(tilde(A)) P[S_(N_s+1) > t | cal(F)_s^N] dif P = e^(-lambda(t-s)) P(tilde(A)) $
となり、$P[S_(N_s+1) > t | cal(F)_s^N] = e^(-lambda(t-s))$ が示された。

== Proof of (ii)

任意の $tilde(A) in cal(F)_s^N$ と整数 $k >= 0, n >= 0$ を固定する。
増分 $N_t - N_s <= k$ という事象を、到着時刻 $S_m$ を用いて解析する。

=== 1. 

次の変数を定義する：
$ Y_k :　= S_(N_s+k+1) - S_(N_s+1) = sum_(j=N_s+2)^(N_s+k+1) T_j $
これは $N_s+1$ 回目の到着から数えて $k$ 回後の到着までの時間である。$Y_k$ は $sigma(T_1, dots, T_(N_s+1))$ と独立であり、パラメータ $lambda$ のガンマ分布に従う。その性質より、次が成り立つ：
$ P[Y_k > theta] = sum_(j=0)^(k-1) ((lambda theta)^j)/(j!) e^(-lambda theta) quad (k >= 1, theta > 0) $

=== 2. 

定義により、次の積分を計算する：
$ integral_(tilde(A) inter {N_s = n}) P[N_t - N_s <= k | cal(F)_s^N] dif P = P[{N_t <= n + k} inter tilde(A) inter {N_s = n}] $

$N_t <= n + k$ は $S_(n+k+1) > t$ と同値である。また $S_(n+k+1) = S_(n+1) + Y_k$ と分解できるので：
$ = P[{S_(n+1) + Y_k > t} inter A inter {N_s = n}] $

ここで $Y_k$ の分布 $P(Y_k in dif u)$ で積分を行う：
$ = integral_0^infinity P[{S_(n+1) + u > t} inter A inter {N_s = n}] dot P(Y_k in dif u) $

積分範囲を $[0, t-s]$ と $[t-s, infinity)$ に分ける：
1. **$u > t - s$ のとき**: $S_(n+1) > s$ であるから $S_(n+1) + u > s + (t - s) = t$ は常に成り立つ。
   したがって、この範囲の積分は $P[tilde(A) inter {N_s = n}] dot P[Y_k > t - s]$ となる。
2. **$u <= t - s$ のとき**: (i) の結果を利用する。
   $P[S_(n+1) > t - u | cal(F)_s^N] = e^(-lambda(t - u - s))$ である。

これらを合わせると：
$ = P[tilde(A) inter {N_s = n}] dot sum_(j=0)^(k-1) e^(-lambda(t-s)) ((lambda(t-s))^j)/(j!) + integral_0^(t-s) P[tilde(A) inter {N_s = n}] e^(-lambda(t-s-u)) P(Y_k in dif u) $

ガンマ分布の密度関数を代入して整理すると、最終的にポアソン分布の和の形に集約される：
$ = P[tilde(A) inter {N_s = n}] dot sum_(j=0)^k e^(-lambda(t-s)) ((lambda(t-s))^j)/(j!) $

=== 3.

全ての $n >= 0$ について和をとれば：
$ integral_(tilde(A)) P[N_t - N_s <= k | cal(F)_s^N] dif P = P(tilde(A)) dot sum_(j=0)^k e^(-lambda(t-s)) ((lambda(t-s))^j)/(j!) $
これは、条件付き確率 $P[N_t - N_s <= k | cal(F)_s^N]$ が $cal(F)_s^N$ に依存しない定数（平均 $lambda(t-s)$ のポアソン分布の累積確率）であることを示している。
よって、$N_t - N_s$ は $cal(F)_s^N$ と独立であり、ポアソン分布に従う。

== 3.3 Definition

A *Poisson process* with intensity $lambda > 0$ is an adapted, integer-valued RCLL process $N = {N_t, cal(F)_t; 0 <= t < infinity}$ such that $N_0 = 0$ a.s., and for $0 <= s < t, N_t - N_s$ is independent of $cal(F)_s$ and is Poisson distributed with mean $lambda(t - s)$.

The *compensated Poisson process*（補正されたポアソン過程） is defined as:
$ M_t = N_t - lambda t, quad cal(F)_t; quad 0 <= t < infinity. $

== 3.4 Problem

Prove that a compensated Poisson process ${M_t, cal(F)_t; t >= 0}$ is a martingale.

=== Proof
$0 <= s < t$ に対して $E[M_t | cal(F)_s] = M_s$ を示す。
$ E[M_t | cal(F)_s] &= E[N_t - lambda t | cal(F)_s] \
&= E[(N_t - N_s) + N_s - lambda t | cal(F)_s] \
&= E[N_t - N_s | cal(F)_s] + E[N_s | cal(F)_s] - lambda t $
Definition 3.3 より $N_t - N_s$ は $cal(F)_s$ と独立であり、その期待値は $lambda(t-s)$ である。また $N_s$ は $cal(F)_s$ 可測である。
$ E[M_t | cal(F)_s] &= lambda(t - s) + N_s - lambda t \
&= lambda t - lambda s + N_s - lambda t \
&= N_s - lambda s = M_s $
したがって、$M_t$ は ${cal(F)_t}$ に関するマーチンゲールである。

= A. Fundamental Inequalities

== 3.6 Proposition

Let ${X_t, cal(F)_t; 0 lt.eq t lt infinity}$ be a martingale (respectively, sub-martingale), and $phi: RR -> RR$ a convex function with $E abs(phi(X_t)) lt infinity$ holds for every $t gt.eq 0$. Then ${phi(X_t), cal(F)_t, 0 lt.eq t lt infinity}$ is a submartingale.

== 3.7 Problem

Let ${X_t = (X_t^((1)), ..., X_t^((d))), cal(F)_t; 0 lt.eq t lt infinity}$ be a vector of martingales, and $phi: RR^d -> RR$ a convex function with $E abs(phi(X_t)) lt infinity$ valid for every $t gt.eq 0$. Then ${phi(X_t), cal(F)_t; 0 lt.eq t lt infinity}$ is a submartingale; in particular ${norm(X_t), cal(F)_t; 0 lt.eq t lt infinity}$ is a submartingale.
=== Proof


==== 1. $phi(X_t)$ が劣マルチンゲールであること

凸関数の性質より、$phi$ は線形関数の族 ${h_alpha : alpha in A}$ の上限として表現できる：
$ phi = sup_(alpha in A) h_alpha $
ここで、各 $h_alpha$ は $h_alpha (x) = a_alpha x + b_alpha$ という形の線形関数である。

任意の $0 <= s < t$ に対して、すべての $alpha in A$ について次が成り立つ：
$ phi(X_t) >= h_alpha (X_t) $
この両辺に、条件付き期待値 $E[dot | cal(F)_s]$ を作用させる。期待値の単調性と $h_alpha$ の線形性（およびマルチンゲール性）より：
$ E[phi(X_t) | cal(F)_s] >= E[h_alpha (X_t) | cal(F)_s] = h_alpha (E[X_t | cal(F)_s]) = h_alpha (X_s) $
この不等式 $ E[phi(X_t) | cal(F)_s] >= h_alpha (X_s) $ はすべての $alpha in A$ に対して成り立つため、右辺において $alpha$ に関する上限（supremum）をとることができる：
$ E[phi(X_t) | cal(F)_s] >= sup_(alpha in A) h_alpha (X_s) = phi(X_s) $
したがって、${phi(X_t), cal(F)_t}$ は劣マルチンゲールである。


==== 2. $norm(X_t)$ が劣マルチンゲールであること

ノルム $norm(dot)$ は凸関数である。実際、三角不等式により凸性の定義を満たすことは容易に確認できる。
また、可積分性については次のように示される：
$ E[norm(X_t)] <= E[|X_t^(1)| + dots + |X_t^(d)|] < infinity $
よって、${norm(X_t), cal(F)_t}$ が劣マルチンゲールであることが示される。
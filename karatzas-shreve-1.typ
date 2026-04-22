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
  title: "Karatzas Shreve Chapter 1, 2.17 - 2.26",
  authors: "Leo",
)


== 2.11の補足
$
  {sup_(s gt.eq 1) T_n lt.eq t} = inter.big_(n=1)^infinity {T_n lt.eq t}
$
は正しいが、
$
  {sup_(n gt.eq 1) T_n lt t} = inter.big_(n=1)^infinity {T_n lt t}
$
は成立しない。例えば、$T_n := 1 - 1/n$ とすれば簡単に確かめられる。
よって、Corollary 2.4 を用いて、$sup_(n gt.eq 1) T_n, t=1$ が stopping time であることを示す必要がある.

== 2.18 Lemma

Let $X := {X_t, cal(F)_t; 0lt.eq t lt infinity}$ be a progressively measurable process, and let T be a stopping time of the filtration ${cal(F)_t}$. Then the random variable $X_T$ of Definition 1.15, defined bythe set ${T lt infinity} in cal(F)_T$, is $cal(F)_T-$measurable, and the "stopped process" ${X_(T and t), cal(F)_t; 0 lt.eq t lt infinity}$ is progressively measurable. 

== Proof

1. $X_T$ が $cal(F)_T$-可測であること：
任意の $B in cal(B)(RR^d)$ に対し、${X_T in B} inter {T lt.eq t} in cal(F)_t$ を示す。写像 $Phi: [0, t] times Omega -> [0, t] times Omega$ を $Phi(s, omega) = (s and T(omega), omega)$ と定義する。$T and t$ は $cal(F)_t$-可測なので、$Phi$ は $cal(B)([0, t]) times.o cal(F)_t$-可測である。$X$ の発展的可測性より、合成写像 $(s, omega) |-> X_(s w T(omega))(omega)$ も可測であり、特に $s=t$ と固定した $X_(t and T)$ は $cal(F)_t$-可測となる。
${X_T in B} inter {T lt.eq t} = {X_(T and t) in B} inter {T lt.eq t}$ であり、右辺の両集合とも $cal(F)_t$ に属するため、$X_T$ は $cal(F)_T$-可測である。

2. 停止プロセス $X_(T and t)$ の発展的可測性：
写像 $Psi: [0, t] times Omega -> [0, t] times Omega$ を $(s, omega) |-> (s and T(omega), omega)$ とすると、これは可測である。発展的可測な $X$ との合成 $X$ もまた $cal(B)([0, t]) times.o cal(F)_t$-可測となるため、結論を得る。\

== 2.19 Problem

Under the same assumptions as in Proposition 2.18, and with $f(t, x): [0, infinity) times RR^d -> RR$ a bounded, $cal(B)([0, infinity]) times.o cal(B)(RR^D)$-measurable function, show that the process $Y_t = integral_0^t f(s, X) dif s; t gt.eq 0$ is progressively measurable with respect to ${cal(F)_t},$ and $Y_T$ is an $cal(F)_T$-measurable random varibale.

== Proof

$f(t, x)$ は有界かつ $cal(B)([0, infinity)) times.o cal(B)(RR^d)$ 可測であり、$X$ は発展的可測なので、合成関数 $(s, omega) |-> f(s, X_s(omega))$ も発展的可測である。
$Y_t (omega) = integral_0^t f(s, X_s (omega)) dif s$ はこの発展的可測な関数の積分として定義される。フビニの定理の一般化により、積分プロセス $Y$ もまた ${cal(F)_t}$ に関して発展的可測となる。
$Y$ が発展的可測であれば、Lemma 2.18 を直接適用することで、$Y_T$ が $cal(F)_T$-可測な確率変数であることも導かれる。

== 2.20 Definition

Let T be an optional time of the filtration ${cal(F)_t}$. The $sigma$-field $cal(F)_(T+)$ of events determined immediately after the optionall time T consists of those events $A in cal(F)$ for which $A inter {T lt.eq t} in cal(F)_(t+)$ for all t.

== 2.21 Problem

Verify that the class $cal(F)_(T+)$ is indeed a $sigma$-field with respect to which T is measurable, that is coincides with ${A in cal(F); A inter {T lt t} in cal(F)_t, forall t gt.eq 0}$, and that if T is a stopping time (so that both $cal(F)_T, cal(F)_(T+)$ are defined), then $cal(F)_T subset cal(F)_(T+)$

== Proof

1. $cal(F)_(T+)$ が $sigma$-代数であること：
明らか。
2. $T$ が $cal(F)_(T+)$-可測であること：
任意の $s$ に対して ${T lt.eq s} and {T lt.eq t} in cal(F)_(t+)$ であることを示せばよい。これは $T$ が任意時間（optional time）であることから明らかである。
3. $cal(F)_T subset cal(F)_(T+)$：
$A in cal(F)_T$ ならば、任意の $t$ に対して $A and {T lt.eq t} in cal(F)_t$ である。$cal(F)_t subset cal(F)_(t+)$ なので、$A and {T lt.eq t} in cal(F)_(t+)$ となり、定義より $A in cal(F)_(T+)$ である。

== 2.22 Problem 

Verify that analogues of Lemmas 2.15 and 2.16 hold if T and S are assumed to be optional and $cal(F)_T, cal(F)_S$ and $cal(F)_(T and S)$ are replaced by $cal(F)_(T+), cal(F)_(S+)$ and $cal(F)_(T and S +)$ respectively. Prove that if S is an optional time and T is a positive stopping time with $S lt.eq T$, and $S lt T$ on ${S lt infinity}$, then $cal(F)_(S+) subset.eq cal(F)_(T+)$

== Proof

Lemma 2.15 と 2.16 の対応する証明において、定義の ${T lt.eq t}$ を ${T lt t}$ に、そして $cal(F)_t$ を $cal(F)_(t+)$ に置き換えることで同様に成立する。
$S lt.eq T$ かつ $S < T$ on ${S < infinity}$ のとき、$cal(F)_(S+) subset.eq cal(F)_(T+)$ について：
$A in cal(F)_(S+)$ とすると、任意の $t$ に対して $A inter {S lt t} in cal(F)_t$ である。
条件 $S lt.eq T$ より ${T lt t} subset {S lt t}$ であり、これを用いて $A' = A inter {S lt t}$ として、 $A' inter {T lt t} in cal(F)_t$ が導かれる。

== 2.23 Problem 

Show that if ${T_N}^infinity_(n=1)$ is a sequence of optional times and $T = inf_(n gt.eq 1) T_n$, then $cal(F)_(T+) = inter.big_(n=1)^infinity cal(F)_(T_n +)$. Besides, if each $T_n$ is a positive stopping time and $T lt T_n$ on ${T lt infinity}$, then we have $cal(F)_(T+) = inter.big_(n=1)^infinity cal(F)_T_n$

== Proof

$T = inf T_n$ に対し、${T lt t} = union.big_(n=1)^infinity {T_n lt t}$ である。各 $T_n$ は任意時間なので ${T_n lt t} in cal(F)_t$ であり、その可算和も $cal(F)_t$ に属する。よって $T$ は任意時間である。\ よって、$cal(F)_(T+) = {A in cal(F); A inter {T lt t} in cal(F)_t} = {A in cal(F); A inter(union.big_(n=1)^infinity {T_n lt t}) in cal(F)_t}= {A in cal(F); union.big_(n=1)^infinity (A inter  {T_n lt t}) in cal(F)_t} =  inter.big_(n=1)^infinity cal(F)_(T_n +)$.

さらに各 $n$ で $T lt T_n$ のとき、$A_n in inter.big_(k=1)^n cal(F)_(T_k)$ であれば、すべての $k lt.eq n$ について $A_n inter {T_k lt t} in cal(F)_t$ となり、極限をとることで $lim_(n-> infinity) A in cal(F)_(T+)$ が示される。

== 2.24 Problem.

Given an optional time T of the filtration ${cal(F)_t}$, consider the sequence ${T_n}^infinity_(n=1)$ of random times given by
$
  T_n (omega) := cases(T(omega)";" quad "on"{omega; T(omega) = + infinity}, k/2^n";" quad "on"{omega; (k-1)/2^n lt.eq T(omega) lt k/2^n})
$
for $n gt.eq 1, k gt.eq 1$. Obviously $T_n gt.eq T_(n+1) gt.eq T$, for every $n gt.eq 1$. Show that $T_n$ is a stopping time, that $lim_(n -> infinity) T_n = T$, and that for every $A in cal(F)_(T+) thick$ we have $A inter {T_n = (k slash 2^n)} in cal(F)_(k slash 2^n); n, k gt.eq 1$ 

== Proof

1. $T_n$ が停止時間であること：
各 $k, n$ に対して、${T_n lt.eq k/2^n} = {T lt k/2^n}$ である。$T$ は任意時間なので、これは $cal(F)_(k/2^n)$ に属する。よって $T_n$ は停止時間である。
2. $lim T_n = T$：
定義より $T lt.eq T_n lt T + 2^(-n)$ なので、$n arrow.r infinity$ で $T_n arrow.b T$ となる。
3. $A in cal(F)_(T+)$ のとき、$A inter {T_n = k/2^n} in cal(F)_(k/2^n)$：
$A inter {T lt k/2^n} in cal(F)_(k/2^n)$ かつ ${T_n = k/2^n} = {(k-1)/2^n lt.eq T lt k/2^n} in cal(F)_(k/2^n)$ より、その共通部分も $cal(F)_(k/2^n)$ に属する。

== 2.26 Proposition. 

If the process $X$ has RCLL(Right Continuous, Left Limit) paths and is adapted to the filtration ${cal(F)_t}$ which satisfies the usual conditions, then there exists a sequence ${T_n}_(n=1)^infinity$ of stopping times of ${cal(F)_t}$ which exhausts the jumps of X, i.e.,
$
  {(t, omega) in (0, infinity) times Omega; X_t(omega) eq.not X_(t-)(omega)} subset.eq union.big_(n=1)^infinity {(t, omega) in [0, infinity) times Omega; T_n (omega) = t}
$
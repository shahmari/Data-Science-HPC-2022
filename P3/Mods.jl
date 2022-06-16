module UsedFuncs

using StatsBase

export NormalizeFunc, FitLine, RSS, TSS, R²

NormalizeFunc(Ans::Vector) = (Ans .- mean(Ans)) / std(Ans)
FitLine(X::Vector, Y::Vector) = [ones(length(X)) hcat(X)] \ Y

RSS(Ys::Vector, Xs::Vector, f::Function) = sum((Ys .- f.(Xs)) .^ 2)
TSS(Ys::Vector) = sum((Ys .- mean(Ys)) .^ 2)
R²(Ys::Vector, Xs::Vector, f::Function) = 1 - (RSS(Ys, Xs, f) / TSS(Ys))

RSS(Ys::Vector, fx::Vector) = sum((Ys .- fx) .^ 2)
R²(Ys::Vector, fx::Vector) = 1 - (RSS(Ys, fx) / TSS(Ys))

end
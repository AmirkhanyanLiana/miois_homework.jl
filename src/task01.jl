export getdigits, touppercase, firstnorm, secondnorm, infnorm, isleap, chesscolor

function getdigits(a)
    a_aray = [];
    while a != 0
        push!(a_aray, a%10);
        a = div(a, 10)
    end
    return a_aray[end:-1:1];
end

function touppercase(str_)
    result = [];
    for x in str_
        if (x>='a')&&(x<='z')
            push!(result, x + ('A' - 'a'));
        else
            push!(result, x);
        end
    end
    return join(result);
end

function firstnorm(vec_::AbstractVector{<:Number})
    n1=0
    for n in vec_
        n1+=abs(vec_)
    end
    return n1 
end

function secondnorm(vec_::AbstractVector{<:Number})
    n2=0
    for n in vec_
        n2+=n^2
    end

    return sqrt(n2)
end

function infnorm(vec_::AbstractVector{<:Number})
    n3 = 0;
    for n in vec_
        if n > n3
            n3 = n
        end
    end
    return n3
end

function firstnorm(vec_::AbstractMatrix{<:Number})
    sum1 = 0
    rows, cols = size(vec_)
    vecsum1 = Array{Any}(undef, 1, cols)
    for j = 1:cols
        for i = 1:rows
            sum1+= vec_[i,j]
        end
        vecsum1[j]=sum1
        sum1=0
    end
    vecsum1
    nA1=0
    for n in vecsum1
        if n>nA1
            nA1=n
        end
    end
    return nA1
end

function infnorm(vec_::AbstractMatrix{<:Number})
    nA3 = 0
    rows, cols = size(vec_)
    for i = 1:rows
        for j = 1:cols
            vec_[i,j] = (vec_[i,j])^2
        end
    end
    vec_
    sum3=0
    for i = 1:rows
        for j = 1:cols
           sum3+=vec_[i,j]
        end
    end
    return (sum3)^(1/2)
end

function isleap(year)

    if year % 4 != 0 || (year % 100 == 0 && year % 400 != 0)
        return false
    else
        return true
    end

end

function chesscolor(cell1, cell2)
    a = (cell1[1] - 'a')+ 1;
    b = cell1[2]

    c = (cell2[1] - 'a') + 1;
    d = cell2[2];
    if ((a+b+c+d) % 2) == 0
        return "yes"
    else
        return "no"
    end
end
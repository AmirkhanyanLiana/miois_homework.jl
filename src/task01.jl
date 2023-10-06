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
        n1+=abs(n)
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

function firstnorm(mat_::AbstractMatrix{<:Number})
    v = 0;
    for col in eachcol(mat_)
        b = 0
        for x in col
            b += x;
        end
        v = v < b ? b : v;
    end
    return v
end

function infnorm(mat_::AbstractMatrix{<:Number})
    v = 0;
    for col in eachrow(mat_)
        b = 0
        for x in col
            b+=x;
        end
        v = v < b ? b : v;
    end
    return v
end

function isleap(year)

    if year % 4 != 0 || (year % 100 == 0 && year % 400 != 0)
        return false
    else
        return true
    end

end

function chesscolor(cell1, cell2)
    a = cell1[1] - 'a'+ 1;
    b = cell1[2]

    c = cell2[1] - 'a' + 1;
    d = cell2[2];
    if ((a+b+c+d) % 2) == 0
        return true
    else
        return false
    end
end
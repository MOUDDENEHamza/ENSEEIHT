function Regions_De_Confiance(algo,f::Function,gradf::Function,hessf::Function,x0,options)

    if options == []
        deltaMax = 10
        gamma1 = 0.5
        gamma2 = 2.00
        eta1 = 0.25
        eta2 = 0.75
        delta0 = 2
        max_iter = 1000
        Tol_abs = sqrt(eps())
        Tol_rel = 1e-15
    else
        deltaMax = options[1]
        gamma1 = options[2]
        gamma2 = options[3]
        eta1 = options[4]
        eta2 = options[5]
        delta0 = options[6]
        max_iter = options[7]
        Tol_abs = options[8]
        Tol_rel = options[9]
    end

    n = length(x0)
    nb_iters = 0
    xk = x0
    xk_1 = x0
    delta = delta0
    CondConvergence = max(Tol_abs, Tol_rel*norm(gradf(x0)))
    optionGct = [deltaMax max_iter Tol_rel]
    for i = 1:max_iter
        nb_iters = i
        xk = xk_1
        if algo == "gct"
            sk = Gradient_Conjugue_Tronque(gradf(xk),hessf(xk),optionGct)
        elseif algo == "cauchy"
            sk, ~ = Pas_De_Cauchy(gradf(xk),hessf(xk),delta)
        else
            print("Nom incorrect , voulez vous dire : gct ou cauchy ? ")
            break
        end # if
        q(s) = f(s)+ gradf(xk)'*(s-xk) + (1/2)*(s-xk)'*hessf(xk)*(s-xk)
        f_xk_sk = f(xk+sk)
        rho_k = (f(xk)-f(xk+sk))/(q(xk)-q(xk+sk))
        if rho_k>eta1
            xk_1 = xk+sk
        else
            xk_1 = xk
        end # if

        if rho_k>eta2
            delta = min(gamma2*delta, deltaMax)
        elseif rho_k>eta1
            delta = delta
        else
            delta = gamma1*delta
        end # if

        "condition d'arret "
        if norm(gradf(xk_1))<=CondConvergence
            flag = 0
            break
        elseif norm(sk)<=max(Tol_abs, Tol_rel*norm(xk))
            flag = 1
            break
        elseif abs(f(xk+sk)-f(xk))<=max(Tol_abs, Tol_rel*abs(f(xk)))
            flag = 2
            break
        end
    end


    if nb_iters == max_iter
        flag = 3
    end

    xmin = xk_1
    f_min = f(xmin)

    return xmin, f_min, flag, nb_iters
end

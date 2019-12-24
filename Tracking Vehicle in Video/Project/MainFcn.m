function video = MainFcn(case_num)
    if case_num == 1
        video = ReadVideo('Case1/case1.wmv');
    elseif case_num == 2
        video = ReadVideo('Case2/case2.avi');
    end
end


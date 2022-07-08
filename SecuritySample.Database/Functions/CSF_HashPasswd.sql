﻿CREATE FUNCTION [dbo].[CSF_HashPasswd]
(
	@Passwd NVARCHAR(50)	
)
RETURNS BINARY(64)
AS
BEGIN
	DECLARE @PreSalt NCHAR(2048) = N'G2Us#BMpNqUSZzkCWGdP*XMq$y&+?V?$%x&+CVKeLwB=ZV=cSq5nXMuv4AvyYdXfNcMQsFY9FyV89?2CyygS$Jh&7VgrCM@xs9QEXUkmrM#8d#5DtdCm&NB!&$e?Q&kaL#Jd%Z?wK_s=K7tukV56u!E3Xhw9JAYDBvXdedH!z9$=n3mR-Cj_ru!V!#Jg5SGYX?EGM*?+StVLY8uwHSDAHFWCa3Nv-t86JwW4dN+TvKm9ch-c@gHkBVu3ehFbQbne-vSQ8xv$f_yAT3+&rGnSh8XkYY-9BB&JJzH7D-_u8N@_T6$ZCGXM3Ey8%X*LGT8L_k%9ZqrsJzRJC5_Cp3KjcCLH2U$?VDfMzgH*7yqT3HN+5araBrH4rQgc5?Y=L!bkv#%umGtp8s5gQNt$KMskby+2XdeC#%f??erA7mqg=Ek^p$MELd3pL&NYHwYQGC-Upf&2_$KS*D3tvzJ?xzV=qvJsP8&X93F4$J$=kd5MdC$+?zE953xU*p%+mqedPLP-vsGqD7%gVFKLUKMPL!WmhB_UqAMp5cTVynsPTnS7Kvkg64fUgkv=w4UZR_Gq35=%E?j%ZcWJET3$xd^tFFTR$Kq6UsKS#2Bm4&Zyh6m?dY3JP^pruj-aVF?2j&=%fQvwaaaK#p?g8%FjHzSX&T6c4Wab%&eZ-?4^%wN%&ZsX7^Kc^@CFAYDUFSpF8!X29srF%tkg2xerkVJTPQn*a-5REkXnuQ6WEU&#@Ahs?a*A&xLTT^RStr9kM*h!JsUMy6y9Y#4L$ybe?k#Nw9N-cvYpagFyz#ETTxr9NRk-nD-p#!u65^TG$S$WbXgNv?-N68#qhv@9FqPrZ57@_YNqB$N%TvtLdmr3gkZW7HDDZrR4H4BD#xGysyAMc+5a^qTP27SgGT-zc-CdbA!?6Hu?BE4hred93NFr%cH?yT2DhsDFkyYft!C=4^f^Fdfraymey+9kKgN?VQ=x$9mHaVA=$RUMpv!+?hjZPqnt_Xe*AtzJcK&Hfv6zh7kQuzCD+Uy?Be2QcfSGYH&mxNVJ+_=5_fpzq!j_Knwnt@%C@Lzz6FbyGyf@PV+x_mRj9AwNL#3b#xEZU&t59s5yMYb#T?njwu*qu-Qw8s8VqFD!b+4BCEVmD+RKJ-qEVS9m%nDshx6U9yCwnEv6-up_p!sQGv&usz&a94MSa_Z5TtbkAB&24mmgdRXs2D-T3uybbEq^$aU+xa+umMP#C2?7%sUw&=QnJStxba#kHxvk=3PLpb?Dedbhu8T+4af^&RFDK#_+B7w@C*-JVewk8D-BD?72h6M$+dRzKU&t+t3pj@M3yV+k=q6hdd?GBkMHgu2avHV-qAd7^Bmm#V6k26Bx?f$%k7mgQT=ALHV?rRhy$F%K2=sFx7qqPwFrJH$JCw+2NjySC&B$c@pF4^ss2=!aGQV@wtPY9x%9CAT&c_eg%n?UpT#E5yGBtjvy^4scccHCV+FUzRr5KtyMHeW53D-y=Yfw%b9E6+x9?9=kURtFKfQ#h++fMW2CNvu+jmp=%Qj449vM*tPF=u_aTm+-?Up2qYWkjemHB*AmPyE+MzeS+fsm_wTE*2y!_&Z=s+$+2^t7_xWdmZjAB@PCV9R5#HnewCAk!kLpPmA_C44#fpE9bCQ_KRhZuh5Jqq=n=w=tYYE7WtAZ2MDE=ZcfbL#Y4GCayv^Z76%LDJ4$!7aeka@bdDqguRPtqB?AqAfw&A!cN?gjC9mpGn5_EE&ZyvyC3!teeGtHY!x&uLPTXGLNpa4zfxCUBG@jd7VUgtB@PuGH&F=7F%b5P#VSTk!jeNjqFS^6q7keNC^qsksSfPSLSvy!AdK8TK2ncL!Z%LDPK3c_yQGjJ%GRah?8h++c4Z6XxBHaa6qT$b=ZzmwEuLYb+yr7Ym+HHFAtA4KFvsAPJm%Kw-qGLLPH?DWfkJGTF^Kcjz=@G5TpAzL?p#xC4wJVGPRnHm=!+fEZjR4PJUS_yYXf4M&uz%N*vXeL7FbVTFybuPqxcKePay^PhEU5*yHGFCJn4js=6+jxyA35=qnEMSZ=4V*_2nL83y=3bkJ5';
	DECLARE @PostSalt NCHAR(2048) = N'VAd+jmE7kwA+yGy2Gkb96THU5p9*Lk%%fsbM-5G-RcJv5b5hs@6AGfNVEaPGT3cZ5w%xjn#*NmLzxSG!Ax-ktXH*&zM^rFeHh!kWa%uZMgx!wC?h$9LdL?KF+8bD?a#4Ukh_F#4uKVBfhUP^39TD%aHS%M-kDQWwgTFdwKL78E5LbFg?Z4k$UhH9Bq3Mx9QJ^*S2EG%meMPc3XR+MPLh?TsM2bYehu^&!K%&^#UGaMcE6BsgcXhdQcfm_TfF$6=#Yq%*EeLdtM7ECtt@%$KGerrnYmKt2$K6t5Zj!BJRxTu#mgTc_ELXB_uZeL?HbrZjDPKB%SH3_Qt%3aAWpZL#F6urWB?tY&Hy-ueA%MZtz_#Eahr%g4TA_L$?&-a?64XUk8hsBRfsm6uY9m6m8%$2YC+mJsf3ae=4D!3-teuExS=eXyg^2#rX@QAg+?EMk6BAm-R*2*6P=p3&x6aK-LhPV^eWrgkjm$?dkPNq9BsRu2Veh+eHD%$pQ%Um&ww^fnA6vcF%zc6!xA?MK-gZSZMxXP8CLe&r*h%VLJK!NwQYc?YgrkYuFB!dCgLzMU@j!7gb7FV6c5A$gf#HJKP2JR*WHRzgtnnxC!F!gjdb49&?dAsyZt33m$jFBk7m-&!a73EfQ*2Dv!Lqe+2Ym^gk7%ZaCD5yxg*2sN3=RdkfAc%LD!@4t^fcw&K3%Q+2qwWcKvGx^PMc$_NDJR=zTF!MpP!9dX3T^VfTNpnxCTk^#qj7Kb9LWEmv%Fqcwx&4t7WV6!pxKex+#WmUpXnHWHe3-^_5f^npmf@J5N7HHpmEh%&VUftUKvUN?ga%yE4zaQ@yzNutqXjjXJ5eLVnE2%bpTp9W#nZ%Hc=V!rB8U5C$d%mE*XULbNn#44rM+&h=wgBzJDJ96WQr!=JXcVvrNkecw_FZaspE3K$%+d9ZUhjCmuth$BdXzxyZ@C4bun_BQk4=kX3m2JfeNnaA2wZG*fJ5J&NeftF#@!9XHfry+QJkFcw%PNwqv!eZ#ST$r&J9V#LkZ-x@&Esr25%7NU9Y49fz9Gs*KvQfzkyu7rSm@!&r=?a2UmH-yq_MCDB&NSJm?R%JmF=4RcCf2*#@6-#NgazG7jzVdgN&n#gUr&DAsa#SG+!&TTP7w#c=xrc7fUWNdE#QdTpvNCfh&KwQ?&+pA8A&ZSPQg66uBQWwN_HW8@2bSJkKsR4EQRtLpfKdLs9h8wSk#czj?wvx3$rN&YzJ9Y*@5A!*9m8xDQSp7XC5&5ubawQxPz-f7pU8RdFaN?JH4!Zqg8M72%K!^wR+qAuXBU9MWBd8Kb9-WsA&CTCu7pj_RVFAjEFvmL4xP96Y+Sx%mCJ_uWREN5eVBew!zrhU*M=M?FhE=9d=Y_t%fGg&R4sEMVh&t&BT3d@QGhdh@zaDP!73Tp8h!$pxz@^TuqamGg!z^7y%5?vJrVXmH!r?$GFGk5kSN3Lu^FPK3e=Uxa=GE=ApMzsH_k-$#zdrs2HSy*9&2=&h#x!kukY^wLc*78FmTj%cv63?+nHrjXmk58Q3kLeSB-esB_L*gB!zCE!FT%%pqtDG#9cCAXRDB7LV_T-DE6jT$C8z4SU-TmC5TDZzy$jtJAFwE7jc*SVGr#e*G-G2Hf=5s&fRf$t6#P6CM923R9_QeP+cW?wdsRdWef7kk_R%9&VxqaygHSmcG%?96thXTUrP5bYKr4tB-76+9=Fh#+skrZWtBbsJAsyMV6caPwUH+&DVw+3r@P4*tbEFSNvxQ?tZJJg6wH^9WAE6cN4u@5t5Rs+k$xu-jWs_H=As_bPG#d$&+pbbpuKP$3Qj%wFYV-#SN#*nU2my#dV!8%MR*8?tXu%T3?q7dT&y9R9aYzuAkZ&*r%e@RneH7PuG=5s?JwfpCEPuY$fk+^r7dCHX?Vvu!vZT_UeVk&A8U&#e?T3uZTs9q&VKCvgtXArKuAk+Pd@GnxEYA5S%&8y*h&=4$@ddZTnS2qskQ6Eb_LxGMw5pqSRA&Utw_WbD$zeeVY8fYTb^D*!nx&8VCKek?Sp&P+KWzxx9TE!uQQE*J96Tc9Bx2j!M';
	RETURN HASHBYTES('SHA2_512', @PreSalt + @Passwd + @PostSalt);
END
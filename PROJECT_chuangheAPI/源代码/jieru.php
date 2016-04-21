
<?php function getBrowser(){
    $agent=$_SERVER["HTTP_USER_AGENT"];
    if(strpos($agent,'MSIE')!==false || strpos($agent,'rv:11.0')) //ie11判断
    return "ie";
    else if(strpos($agent,'Firefox')!==false)
    return "firefox";
    else if(strpos($agent,'Chrome')!==false)
    return "chrome";
    else if(strpos($agent,'Opera')!==false)
    return 'opera';
    else if((strpos($agent,'Chrome')==false)&&strpos($agent,'Safari')!==false)
    return 'safari';
}
function getBrowserVer(){
    $agent= $_SERVER['HTTP_USER_AGENT'];   
    if (preg_match('/MSIE\s(\d+)\..*/i', $agent, $regs))
        return $regs[1];
    elseif (preg_match('/FireFox\/(\d+)\..*/i', $agent, $regs))
        return $regs[1];
    elseif (preg_match('/Opera[\s|\/](\d+)\..*/i', $agent, $regs))
        return $regs[1];
    elseif (preg_match('/Chrome\/(\d+)\..*/i', $agent, $regs))
        return $regs[1];
    elseif ((strpos($agent,'Chrome')==false)&&preg_match('/Safari\/(\d+)\..*$/i', $agent, $regs))
        return $regs[1];
}
echo ''.$_SERVER["HTTP_USER_AGENT"];?>
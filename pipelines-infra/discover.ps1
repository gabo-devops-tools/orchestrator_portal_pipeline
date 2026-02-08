param(
    [Parameter(Mandatory=$true)]
    [string]$workingDirectory
)
 
$result = [pscustomobject]@{}
$longstring = "status"
$containstf = Get-ChildItem -Path $workingDirectory  -Recurse -Include "*.tf" | ForEach-Object { $_.Directory.FullName } | Where-Object { $_ -notmatch "disable" }  | Sort-Object -Unique 
Write-Host $containstf 
foreach ($parentDir in $containstf)
{

    #$parentDir = $stykerConfig.Directory.Name
   $foldername =  Split-Path $parentDir -Leaf
   $newsubdir = $parentDir.Substring($workingDirectory.Length+1) 
   $newPath = $newsubdir -replace '\\','/'


    Write-Host  $foldername

    $longstring = $longstring + "," + $foldername


    if ($null -eq (Get-Member -inputobject $result -name $foldername -Membertype Properties))
    {
        $result | Add-Member -TypeName String -MemberType NoteProperty -Name $foldername -Value @{ modules =  $newPath }
    }
     
}
 
$resultJson = $result | ConvertTo-Json -Compress
Write-Host "##vso[task.setvariable variable=complexmodule;isOutput=true]$resultJson"

Write-Host "##vso[task.setvariable variable=longstring;isOutput=true]$longstring"

Write-Host $longstring


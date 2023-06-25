# Declare associative array, pairs of filename and url.
# Before run this script, Edit keys and values to suit.
$urls_and_files = @{
  'dbd739508ac212'       = 'https://zenn.dev/saggggo/articles/dbd739508ac212';
  'dcd00dac7a00aa4d2aa4' = 'https://qiita.com/inbyt/items/dcd00dac7a00aa4d2aa4';
  'shell'                = 'https://learn.microsoft.com/ja-jp/powershell/scripting/learn/shell/running-commands?view=powershell-7.3';
};

# Make dir by referencing datetime.
$dirname = Get-Date -UFormat "%Y%m%d_%H%M%S";
New-Item $dirname -ItemType Directory;

# curl urls and output htmls.
foreach ($entry in $urls_and_files.GetEnumerator()) {
  $url = ($entry.Value);
  $filename = ($dirname + "/" + $entry.Key + ".html");
  Write-Host ("「" + $url + "」 => 「" + $filename + "」");
  curl ($url) -o ($filename);

}

# display recommended command
Write-Host ('Following command is copied. Hit [ctrl + v], You can paste the command.') -ForegroundColor Yellow;
$recommended_command = 'npx markuplint "' + $dirname + '/*.html" -c .markuplintrc';
Set-Clipboard -V $recommended_command;
Write-Host ($recommended_command) -ForegroundColor DarkGray;

git config --global user.email "nbjorner@microsoft.com"

git config --global user.name "Nikolaj Bjorner"

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\VC\Auxiliary\Build\vcvars64.bat"

python scripts\mk_win_dist.py --x64-only --dotnet-key=$(Agent.TempDirectory)\z3.snk

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\VC\Auxiliary\Build\vcvars32.bat"

python scripts\mk_win_dist.py --x86-only --dotnet-key=$(Agent.TempDirectory)\z3.snk

xcopy dist\*.zip bin\nightly\* /y

cd bin\nightly

git add *.zip

git commit -s -a -m "nightly Windows"

git push


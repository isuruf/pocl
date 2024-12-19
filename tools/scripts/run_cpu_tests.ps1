# run_cpu_tests.ps1 - PowerShell script for running tests against CPU device
#
# Copyright (c) 2024 Henry Linjamäki / Intel Finland Oy
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

$env:POCL_BUILDING = '1'
$env:POCL_DEVICES = 'cpu'

if (!$Env:OCL_ICD_FILENAMES) {
    $Env:OCL_ICD_FILENAMES = "" + (Get-Location) + "\lib\CL\pocl.dll"
}

# To find loadable drivers
$devices_path = "" + (Get-Location) + "\lib\CL\devices"
$devices_pocl_path = "" + (Get-Location) + "\lib\CL\devices\pocl"
$Env:Path = "$Env:Path;" + $devices_path
mkdir $devices_pocl_path
Get-ChildItem -Path $devices_path -Directory Where-Object { $_.FullName -ne $devices_pocl_path } | Get-ChildItem -File -Recurse -Filter pocl-devices-*.dll | Copy-Item -Destination $devices_pocl_path

if (Test-Path -Path $Env:OCL_ICD_FILENAMES) {
    write-host "Using OCL_ICD_FILENAMES: $Env:OCL_ICD_FILENAMES"
} else {
    $Env:OCL_ICD_FILENAMES = ""
}

$TEST_TYPE = $args[0]

if ($TEST_TYPE -eq "cbs") {
    $Env:POCL_WORK_GROUP_METHOD=cbs
    ctest -L internal @args
} elseif ($TEST_TYPE -eq "loopvec") {
    $Env:POCL_WORK_GROUP_METHOD=loopvec
    ctest -L internal @args
} elseif ($TEST_TYPE -eq "mingw") {
    ctest -L internal -LE mingw_fail @args
} else {
    ctest -L internal @args
}

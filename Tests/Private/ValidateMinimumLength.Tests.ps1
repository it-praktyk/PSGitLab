$ModuleName = Split-Path (Resolve-Path "$PSScriptRoot\..\..\" ) -Leaf
$ModuleManifest = Resolve-Path "$PSScriptRoot\..\..\Release\$ModuleName.psd1"

Get-Module $ModuleName | Remove-Module

Import-Module $ModuleManifest

InModuleScope -ModuleName $ModuleName {
    Describe 'ValidateMinimumLength' {

        It 'Correct string, default length' {
            ValidateMinimumLength -StringToValidate 'group' | Should -Be $true
        }

        It 'Correct string, custom length' {
            ValidateMinimumLength -StringToValidate 'group' -MinimumLegth 4 | Should -Throw
        }

        It 'Incorrect string, default length' {
            ValidateMinimumLength -StringToValidate 'gr' | Should -Be $true
        }

        It 'Incorrect string, custom length' {
            ValidateMinimumLength -StringToValidate 'gro' -MinimumLegth 4 | Should -Throw
        }

    }

}
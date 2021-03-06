$ModulePath = Split-Path -Parent $MyInvocation.MyCommand.Path;
$ModulePath = Resolve-Path "$ModulePath\..\DeployCube\DeployCube.psd1";
Import-Module -Name $ModulePath;

Describe "Unpublish-Cube" {
    Context "Testing Inputs" {
        It "Should have Server as a mandatory parameter" {
            (Get-Command Unpublish-Cube).Parameters['Server'].Attributes.mandatory | Should -Be $true
        }
        It "Should have CubeDatabase as a mandatory parameter" {
            (Get-Command Unpublish-Cube).Parameters['CubeDatabase'].Attributes.mandatory | Should -Be $true
        }
        It "Empty server" {
            { Unpublish-Cube -Server ""  -CubeDatabase "master" } | Should Throw;
        }
        It "Null server" {
            { Unpublish-Cube -Server $null  -CubeDatabase "master" } | Should Throw;
        }
        It "Empty database" {
            { Unpublish-Cube -Server "localhost"  -CubeDatabase "" } | Should Throw;
        }
        It "Null database" {
            { Unpublish-Cube -Server "localhost"  -CubeDatabase $null } | Should Throw;
        }
    }

    Context "Testing Inputs for Alias Drop-Cube" {
        It "Should have Server as a mandatory parameter" {
            (Get-Command Drop-Cube).Parameters['Server'].Attributes.mandatory | Should -Be $true
        }
        It "Should have CubeDatabase as a mandatory parameter" {
            (Get-Command Drop-Cube).Parameters['CubeDatabase'].Attributes.mandatory | Should -Be $true
        }
        It "Empty server" {
            { Drop-Cube -Server ""  -CubeDatabase "master" } | Should Throw;
        }
        It "Null server" {
            { Drop-Cube -Server $null  -CubeDatabase "master" } | Should Throw;
        }
        It "Empty database" {
            { Drop-Cube -Server "localhost"  -CubeDatabase "" } | Should Throw;
        }
        It "Null database" {
            { Drop-Cube -Server "localhost"  -CubeDatabase $null } | Should Throw;
        }
    }

    Context "Main Tests" {
        It "Invalid server" {
            { Unpublish-Cube -Server "InvalidServer" -CubeDatabase "CubeToPublish" } | Should Throw;
        }

        It "Valid server and invalid database" {
            { Unpublish-Cube -Server "localhost" -CubeDatabase "InvalidDatabase" } | Should Not Throw;
        }


    }
}

Remove-Module -Name DeployCube

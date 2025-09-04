package tests

import (
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

// TestSmoke_lambda runs the smoke fixture for lambda using terraform.tfvars.
func TestSmoke_lambda(t *testing.T) {
	t.Parallel()

	// Fixture directory stays the same
	fixtureDir := filepath.Join("..", "tests", "fixtures", "smoke")

	terraformOptions := &terraform.Options{
		TerraformDir: fixtureDir,
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
}

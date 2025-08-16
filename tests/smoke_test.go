package tests

import (
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

// TestSmoke_lambda runs the smoke fixture for lambda.
func TestSmoke_lambda(t *testing.T) {
	t.Parallel()

	fixtureDir := filepath.Join("..", "tests", "fixtures", "smoke")
	terraformOptions := &terraform.Options{
		TerraformDir: fixtureDir,
		Vars:         readConfig(t),
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
}

// readConfig loads test-config.json from module root
func readConfig(t *testing.T) map[string]interface{} {
	path := filepath.Join("..", "test-config.json")
	return terraform.ReadJsonAsTerraformVars(t, path)
}

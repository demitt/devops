import com.cloudbees.plugins.credentials.*
import com.cloudbees.plugins.credentials.domains.Domain
import com.cloudbees.plugins.credentials.impl.*
import hudson.util.Secret
import jenkins.model.Jenkins

def env = System.getenv()

def jenkins = Jenkins.getInstance()
def domain = Domain.global()
def store = jenkins.getExtensionList('com.cloudbees.plugins.credentials.SystemCredentialsProvider')[0].getStore()

def jenkinsKeyUsernameWithPasswordForTomcat = new UsernamePasswordCredentialsImpl(
  CredentialsScope.GLOBAL,
  env.TOMCAT_MANAGER_SCRIPT_CREDS_ID,
  env.TOMCAT_MANAGER_SCRIPT_CREDS_DESCRIPTION,
  env.TOMCAT_MANAGER_SCRIPT_USER,
  env.TOMCAT_MANAGER_SCRIPT_PASS
)

store.addCredentials(domain, jenkinsKeyUsernameWithPasswordForTomcat)
jenkins.save()

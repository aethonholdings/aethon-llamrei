import com.llamrei.domain.SecRole
import com.llamrei.domain.SecUser
import com.llamrei.domain.SecUserSecRole

class BootStrap {

    def init = { servletContext ->

        def operatorRole = SecRole.findByAuthority('ROLE_OPERATOR') ?: new SecRole(authority: 'ROLE_OPERATOR').save(failOnError: true)
        def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)
        def financeRole = SecRole.findByAuthority('ROLE_FINANCE') ?: new SecRole(authority: 'ROLE_FINANCE').save(failOnError: true)
        def engineerRole = SecRole.findByAuthority('ROLE_ENGINEER') ?: new SecRole(authority: 'ROLE_ENGINEER').save(failOnError: true)


        def adminUser = SecUser.findByUsername('admin') ?: new SecUser(
                username: 'admin',
                password: 'password',
                email:'sonaligupta847@gmail.com',
                enabled: true).save(failOnError: true)

        if (!adminUser.authorities.contains(adminRole)) {
            SecUserSecRole.create adminUser, adminRole
        }
        if(!adminUser.authorities.contains(operatorRole)){
            SecUserSecRole.create adminUser, operatorRole
        }

        def operatorUser = SecUser.findByUsername('operator') ?: new SecUser(
                username: 'operator',
                password: 'password',
                email:'damyantsoftware@gmail.com',
                enabled: true).save(failOnError: true)

        if (!operatorUser.authorities.contains(operatorRole)) {
            SecUserSecRole.create operatorUser, operatorRole
        }

        def financeUser = SecUser.findByUsername('finance') ?: new SecUser(
                username: 'finance',
                password: 'password',
                email:'finance@gmail.com',
                enabled: true).save(failOnError: true)

        if (!financeUser.authorities.contains(financeRole)) {
            SecUserSecRole.create financeUser, financeRole
        }
        def engineerUser = SecUser.findByUsername('engineer') ?: new SecUser(
                username: 'engineer',
                password: 'password',
                email: 'engineer@gmail.com',
                enabled: true).save(failOnError: true)

        if (!engineerUser.authorities.contains(engineerRole)) {
            SecUserSecRole.create engineerUser, engineerRole
        }

        def destroy = {
        }
}
}
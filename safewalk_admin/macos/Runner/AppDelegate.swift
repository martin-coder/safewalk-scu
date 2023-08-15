import UIKit
import Firebase
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        // Initialize Google Sign-In
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        return true
    }

    // Handle Google Sign-In
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("Google Sign-In error: \(error.localizedDescription)")
            return
        }

        // Use the user's ID token and Google credentials to authenticate with Firebase
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)

        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                print("Firebase Authentication error: \(error.localizedDescription)")
                return
            }
            // User is signed in
            // Handle your navigation or UI updates here
        }
    }

    // Handle other AppDelegate methods as needed
}

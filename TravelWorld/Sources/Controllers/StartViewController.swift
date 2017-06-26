import UIKit
import FirebaseAuth

class StartViewController: BaseViewController {

    // MARK: - IBOutlet

    // MARK: - Varialbes

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // check app
        self.checkApp()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    // MARK: - Setup View

    // MARK: - Actions

    // MARK: - Call Api

    // MARK: - Functions
    private func checkApp() {

        let handle: AuthStateDidChangeListenerHandle? = Auth.auth().addStateDidChangeListener { (_, user) in

            if user != nil {
                // Main app
                self.perform(#selector(StartViewController.gotoMainApp), with: nil, afterDelay: 1)
            } else {
                // User module (login, register, ...)
                self.perform(#selector(StartViewController.gotoUser), with: nil, afterDelay: 1)
            }
        }

        Auth.auth().removeStateDidChangeListener(handle!)
    }

    func gotoUser() {
        let userSettingVC = LoginViewController.getViewControllerFromStoryboard(Storyboard.User.name)
        let navigationVC = UINavigationController(rootViewController: userSettingVC)
        navigationVC.navigationBar.isHidden = true
        // create animator for present
        //        let animator = Animator(presentedType: .push, dismissedType: .push)
        //        self.menuViewController?.animator = animator
        //
        //        navigationVC.transitioningDelegate = self.menuViewController

        // present
        self.present(navigationVC, animated: false, completion: nil)
    }

    func gotoMainApp() {
        self.mainViewController?.setupMainApp()
    }
}

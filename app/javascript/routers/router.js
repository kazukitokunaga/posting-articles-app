import Vue       from 'vue'
import VueRouter from 'vue-router'
import Index     from 'pages/Index.vue'
// basicInformation
import BasicInformation from 'pages/basicInformation/Index.vue'
import Care from '../pages/basicInformation/Care.vue'
import EducationalBackground from '../pages/basicInformation/EducationalBackground.vue'
import EmploymentHistory from '../pages/basicInformation/EmploymentHistory.vue'
import PastAddress from '../pages/basicInformation/PastAddress.vue'
import Qualification from '../pages/basicInformation/Qualification.vue'
import ThingsToTell from '../pages/basicInformation/ThingsToTell.vue'
import UserProfile from 'pages/basicInformation/UserProfile.vue'
// setting
import Setting from 'pages/setting/Index.vue'

Vue.use(VueRouter)

const routes = [
  { path: '/', component: Index },
  {
    path: '/basicinformation', component: BasicInformation, name: 'basicinformation',
    children: [
      {
        path: 'care',
        component: Care,
        name: 'care',
      },
      {
        path: 'educationalbackground',
        component: EducationalBackground,
        name: 'educationalbackground',
      },
      {
        path: 'employmenthistory',
        component: EmploymentHistory,
        name: 'employmenthistory',
      },
      {
        path: 'pastaddress',
        component: PastAddress,
        name: 'pastaddress',
      },
      {
        path: 'qualification',
        component: Qualification,
        name: 'qualification',
      },
      {
        path: 'thingstotell',
        component: ThingsToTell,
        name: 'thingstotell',
      },
      {
        path: 'userprofile',
        component: UserProfile,
        name: 'userprofile',
      },
    ]
  },
  { path: '/setting', component: Setting, name: 'setting' },
]

const router = new VueRouter({
  routes
})

export default router
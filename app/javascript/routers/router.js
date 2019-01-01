import Vue       from 'vue'
import VueRouter from 'vue-router'
import Index     from 'pages/Index.vue'
import BasicInformation from 'pages/basicInformation/Index.vue'
import UserProfile from 'pages/basicInformation/UserProfile.vue'
import Setting from 'pages/setting/Index.vue'

Vue.use(VueRouter)

const routes = [
  { path: '/', component: Index },
  {
    path: '/basicinformation', component: BasicInformation, name: 'basicinformation',
    children: [
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
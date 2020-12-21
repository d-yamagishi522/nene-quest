<template>
  <canvas
    width="1000"
    height="600"
    class="canvas"
  />
</template>

<script>
export default {
  props: {
    side: {
      type: Number,
      default: 50,
    },
    vertical: {
      type: Number,
      default: 50,
    }
  },
  data() {
    return {}
  },
  mounted() {
    this.ctx = this.$el.getContext('2d')
    // 高さをランダムで指定
    const v = Math.floor( Math.random() * 400)
    this.spawnEnemy(v)
  },
  methods: {
    spawnEnemy(vertical) {
      const ctx = this.$el.getContext('2d')
      const enemy = {
        ctx,
        side: 400,
        vertical,
      }
      // 右移動の処理
      const id = setInterval(() => {
        const num = this.abs(enemy.side)
        // あたり判定
        if (num < 5000 && this.vertical - 100 < enemy.vertical && enemy.vertical < this.vertical + 100 && this.side < enemy.side) {
          enemy.ctx.clearRect(0, 0, 1000, 600)
          clearInterval(id)
        } else {
          const img = new Image()
          // 5移動するたびに画像を入れ替える
          if (((enemy.side) / 5) % 10 < 5) {
            img.src = require('@/assets/icons/enemy1.png')
          } else {
            img.src = require('@/assets/icons/enemy2.png')
          }
          img.onload = () => {
            enemy.ctx.clearRect(0, 0, 1000, 600)
            // 画像, 横移動, 縦移動
            this.ctx.drawImage(img, enemy.side, enemy.vertical)
          }
          enemy.side = enemy.side - 5
          // 画面外に出たら削除
          if (enemy.side < -300) {
            enemy.ctx.clearRect(0, 0, 1000, 600)
            clearInterval(id)
          }
        }
      }, 50)
    },
    abs (s) {
      const sn = (Number(s) - Number(this.side)) * (Number(s) - Number(this.side))
      return sn
    }
  }
}
</script>

<style scoped>
.canvas {
  width: 100%;
  height: 100vh;
}
</style>
